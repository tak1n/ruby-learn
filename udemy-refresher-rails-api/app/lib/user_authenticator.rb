class UserAuthenticator
  AuthenticationError = Class.new(StandardError)

  attr_reader :user

  def initialize(code, client = build_client)
    @code = code
    @client = client
  end

  def perform
    if token.respond_to?(:error)
      raise AuthenticationError
    else
      prepare_user
    end
  end

  private

  attr_reader :code, :client

  def build_client
    Octokit::Client.new(
      client_id: ENV["GITHUB_CLIENT_ID"],
      client_secret: ENV["GITHUB_CLIENT_SECRET"]
    )
  end

  def token
    @token ||= client.exchange_code_for_token(code)
  end

  def user_data
    @user_data ||=
      Octokit::Client
        .new(access_token: token)
        .user
        .to_h
        .slice(:login, :avatar_url, :url, :name)
  end

  def prepare_user
    @user =
      if User.exists?(login: user_data[:login])
        User.find_by(login: user_data[:login])
      else
        User.create!(user_data.merge(provider: "github"))
      end

    @user
  end
end
