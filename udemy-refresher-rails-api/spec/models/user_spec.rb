require "rails_helper"

RSpec.describe User, type: :model do
  describe "#validations" do
    it "has a valid factory" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "should validate presence of attributes" do
      user = build(:user, login: nil, provider: nil)
      expect(user).to be_invalid
      expect(user.errors).to have_key(:login)
      expect(user.errors).to have_key(:provider)
    end

    it "should validate uniqueness of login" do
      user = create(:user)
      other_user = build(:user, login: user.login)

      expect(other_user).to be_invalid
      expect(other_user.errors).to have_key(:login)

      other_user.login = "newlogin"

      expect(other_user).to be_valid
    end
  end
end
