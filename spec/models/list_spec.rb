require 'rails_helper'

RSpec.describe List, type: :model do

  let(:user) { create(:user) }
  let(:list) { create(:list, user_id: user.id) }

  context "data is valid" do
    
    before do
      list.tag_list = "ハワイ"
    end

    it "with user_id, title, body, departure_date, return_date" do
      expect(list).to be_valid
    end
  end

  context "data is invalid" do
    
    before do
      list.title = ""
    end

    it "because no title has been entered" do
      expect(list).to be_invalid
      expect(list.errors[:title]).to include("は1文字以上で入力してください", "を入力してください")
    end
  end

  context "data is invalid" do
    
    before do
      list.title = "あ" * 76
    end

    it "because title is so long" do
      expect(list).to be_invalid
      expect(list.errors[:title]).to include("は75文字以内で入力してください")
    end
  end

  context "data is invalid" do
    
    before do
      list.departure_date = "2020/02/24"
      list.return_date = "2020/02/23"
    end

    it "because return date is faster than departure date" do
      expect(list).to be_invalid
      expect(list.errors[:departure_date]).to include("は帰宅日より前に設定してください")
    end
  end

  context "data is invalid" do
    
    before do
      list.departure_date = ""
    end

    it "because one side is not entered" do
      expect(list).to be_invalid
      expect(list.errors[:departure_date]).to include("と帰宅日のうち片方だけの入力はできません")
    end
  end

  context "data is invalid" do
    
    before do
      list.return_date = ""
    end

    it "because one side is not entered" do
      expect(list).to be_invalid
      expect(list.errors[:departure_date]).to include("と帰宅日のうち片方だけの入力はできません")
    end
  end

  context "data is invalid" do
    
    before do
      list.tag_list = "ハワイ, イルカ, カメ, シュノーケリング"
    end
    
    it "because tag_list limit is 3" do
      expect(list).to be_invalid
      expect(list.errors[:tag_list]).to include("数が限界を超えました！　限界タグ数は3です！")
    end
  end
end
