require 'rails_helper'

RSpec.describe List, type: :model do
  context "data is valid" do
    
    before do
      @list = List.new
      @list.id = 1
      @list.user_id = 1
      @list.title = "ハワイ旅行"
      @list.body = "旅行行きました。"
      @list.departure_date = "2020/02/22"
      @list.return_date = "2020/02/23"
      @list.tag_list = "ハワイ"
    end
    it "with user_id, title, body, departure_date, return_date" do
      expect(@list).to be_valid
    end
  end

  context "data is invalid" do
    
    before do
      @list = List.new
      @list.id = 1
      @list.user_id = 1
      @list.title = ""
      @list.body = "旅行行きました。"
      @list.departure_date = "2020/02/22"
      @list.return_date = "2020/02/23"
      @list.tag_list = "ハワイ"
    end
    it "because no title has been entered" do
      expect(@list).to be_invalid
      expect(@list.errors[:title]).to include("は1文字以上で入力してください", "を入力してください")
    end
  end

  context "data is invalid" do
    
    before do
      @list = List.new
      @list.id = 1
      @list.user_id = 1
      @list.title = "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ"
      @list.body = "旅行行きました。"
      @list.departure_date = "2020/02/22"
      @list.return_date = "2020/02/23"
      @list.tag_list = "ハワイ"
    end
    it "because title is so long" do
      expect(@list).to be_invalid
      expect(@list.errors[:title]).to include("は75文字以内で入力してください")
    end
  end

  context "data is invalid" do
    
    before do
      @list = List.new
      @list.id = 1
      @list.user_id = 1
      @list.title = "ハワイ旅行"
      @list.body = "旅行行きました。"
      @list.departure_date = "2020/02/24"
      @list.return_date = "2020/02/23"
      @list.tag_list = "ハワイ"
    end
    it "because return date is faster than departure date" do
      expect(@list).to be_invalid
      expect(@list.errors[:departure_date]).to include("は帰宅日より前に設定してください")
    end
  end

  context "data is invalid" do
    
    before do
      @list = List.new
      @list.id = 1
      @list.user_id = 1
      @list.title = "ハワイ旅行"
      @list.body = "旅行行きました。"
      @list.departure_date = ""
      @list.return_date = "2020/02/23"
      @list.tag_list = "ハワイ"
    end
    it "because one side is not entered" do
      expect(@list).to be_invalid
      expect(@list.errors[:departure_date]).to include("と帰宅日のうち片方だけの入力はできません")
    end
  end

  context "data is invalid" do
    
    before do
      @list = List.new
      @list.id = 1
      @list.user_id = 1
      @list.title = "ハワイ旅行"
      @list.body = "旅行行きました。"
      @list.departure_date = "2020/02/23"
      @list.return_date = ""
      @list.tag_list = "ハワイ"
    end
    it "because one side is not entered" do
      expect(@list).to be_invalid
      expect(@list.errors[:departure_date]).to include("と帰宅日のうち片方だけの入力はできません")
    end
  end
end
