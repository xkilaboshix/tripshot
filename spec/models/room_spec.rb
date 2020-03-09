require 'rails_helper'

RSpec.describe Room, type: :model do
  
  context "data is valid" do
    
    before do
      @room = Room.new(
        name: "hoge",
        owner_id: 1
      )
    end

    it "with name, owner_id" do
      expect(@room).to be_valid
    end
  end

  context "data is invalid" do
    
    before do
      @room = Room.new(
        name: "",
        owner_id: 1
      )
    end

    it "because name is blank" do
      expect(@room).to be_invalid
      expect(@room.errors[:name]).to include("は1文字以上で入力してください", "を入力してください")
    end
  end

  context "data is invalid" do
    
    before do
      @room = Room.new(
        name: "あ" * 31,
        owner_id: 1
      )
    end

    it "because name limit 30" do
      expect(@room).to be_invalid
      expect(@room.errors[:name]).to include("は30文字以内で入力してください")
    end
  end
end
