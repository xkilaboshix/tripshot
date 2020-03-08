require 'rails_helper'
# 保存確認
RSpec.describe User, type: :model do
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  context "when data is saved correctly" do

    before do
      @user = User.new
      @user.is_enabled = true
      @user.name = "テスト"
      @user.profile_image_id = Rack::Test::UploadedFile.new(image_path)
      @user.background_image_id = Rack::Test::UploadedFile.new(image_path)
      @user.achievement = "旅見習い"
      @user.email = "test@test.test"
      @user.password = 111111
      @user.password_confirmation = 111111
    end

    it "is valid with is_enabled, name, profile_image_id, background_image_id, achievement, email, password, password_confirmation" do
      expect(@user).to be_valid
    end

  end
  # 名前存在確認
  context "when data is not saved correctly" do
    before do
      @user = User.new
      @user.is_enabled = true
      @user.name = ""
      @user.profile_image_id = Rack::Test::UploadedFile.new(image_path)
      @user.background_image_id = Rack::Test::UploadedFile.new(image_path)
      @user.achievement = "旅見習い"
      @user.email = "test@test.test"
      @user.password = 111111
      @user.password_confirmation = 111111
    end

    it "is not saved because no name has been entered" do
      expect(@user).to be_invalid
      expect(@user.errors[:name]).to include("は1文字以上で入力してください")
    end
  end
  # 名前8文字以内テスト
  context "when data is not saved correctly" do
    before do
      @user = User.new
      @user.is_enabled = true
      @user.name = "あああああああああ"
      @user.profile_image_id = Rack::Test::UploadedFile.new(image_path)
      @user.background_image_id = Rack::Test::UploadedFile.new(image_path)
      @user.achievement = "旅見習い"
      @user.email = "test@test.test"
      @user.password = 111111
      @user.password_confirmation = 111111
    end
    it "is not saved because the name has not been entered within 8 characters" do
      expect(@user).to be_invalid
      expect(@user.errors[:name]).to include("は8文字以内で入力してください")
    end
  end
end



