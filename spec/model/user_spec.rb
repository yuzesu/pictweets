# require 'rails_helper'
# describe User do
#   describe '#create' do
#     it "is invalid without a nickname" do
#      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
#      user.valid?
#      expect(user.errors[:nickname]).to include("can't be blank")
#     end
#   end
# end

require 'rails_helper'

describe User do
  describe '#create' do

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email addres" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation:"")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a nickname that has more than 7 characters" do
      user = build(:user, nickname: "aaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "is valid with a nickname that has less than 6 characters" do
      user = build(:user, nickname:"aaaaaa")
      expect(user).to be_valid
    end

    it "is invalid with password that has less than 5 characters" do
      user = build(:user, password:"00000",password_confirmation:"00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end



