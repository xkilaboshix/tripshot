require 'rails_helper'
# 保存確認
RSpec.describe User, type: :model do
  
  context "data is valid" do

    before do
      @user = create(:user)
    end

    it "with is_enabled, name, profile_image_id, background_image_id, achievement, email, password, password_confirmation" do
      expect(@user).to be_valid
    end

  end
  # 名前存在確認
  context "data is invalid" do
    before do
      @user = create(:user)
      @user.name = ""
    end

    it "because no name has been entered" do
      expect(@user).to be_invalid
      expect(@user.errors[:name]).to include("は1文字以上で入力してください")
    end
  end
  # 名前8文字以内テスト
  context "data is invalid" do
    before do
      @user = create(:user)
      @user.name = "あ" * 9
    end
    it "because name has not been entered within 8 characters" do
      expect(@user).to be_invalid
      expect(@user.errors[:name]).to include("は8文字以内で入力してください")
    end
  end
  context "data is invalid" do

    before do
      @user = create(:user)
      @user.email = "testtesttest"
    end

    it "because email has not been entered correctly" do
      expect(@user).to be_invalid
      expect(@user.errors[:email]).to include("は不正な値です")
    end

  end
end



