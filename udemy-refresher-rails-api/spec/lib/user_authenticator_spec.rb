require "rails_helper"

describe UserAuthenticator do
  describe "#perform" do
    let(:authenticator) { described_class.new("sample_code", client) }
    let(:client) { double(Octokit::Client) }

    context "when code is incorrect" do
      let(:error) { double("Sawyer::Resource", error: "bad_verification_code") }

      before do
        allow(error).to receive(:[]).and_return(error.error)
        allow(client).to receive(:exchange_code_for_token).and_return(error)
      end

      it "raises an error" do
        expect { authenticator.perform }.to raise_error(
          UserAuthenticator::AuthenticationError
        )
        expect(authenticator.user).to eq(nil)
      end
    end

    context "when code is correct" do
      let(:user_data) do
        {
          login: "testuser",
          name: "Test User",
          avatar_url: "http://www.example.com/avatar",
          url: "http://www.example.com"
        }
      end

      before do
        allow(client).to receive(:exchange_code_for_token).and_return(
          "validtoken"
        )

        allow_any_instance_of(Octokit::Client).to receive(:user).and_return(
          user_data
        )
      end

      it "saves the user when not existing" do
        expect { authenticator.perform }.to change(User, :count).by(1)
        expect(User.last.name).to eq(user_data[:name])
      end

      context "when user already exists" do
        it "reuses existing user" do
          user = create(:user, user_data)

          expect { authenticator.perform }.to change(User, :count).by(0)
          expect(authenticator.user.id).to eq(user.id)
        end
      end

      it "creates and set users access token" do
        expect { authenticator.perform }.to change(AccessToken, :count).by(1)
        expect(authenticator.access_token).to be_present
      end
    end
  end
end
