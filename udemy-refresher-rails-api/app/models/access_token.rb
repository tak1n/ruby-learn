class AccessToken < ApplicationRecord
  after_initialize :generate_token

  validates :token, presence: true, uniqueness: true

  belongs_to :user

  private

  def generate_token
    loop do
      self.token = SecureRandom.hex(10)
      break if !AccessToken.exists?(token: token)
    end
  end
end
