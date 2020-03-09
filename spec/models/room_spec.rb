require 'rails_helper'

RSpec.describe Room, type: :model do

  let(:room) { create(:room) }
  
  context "data is valid" do

    it "with name, owner_id" do
      expect(room).to be_valid
    end
  end

  context "data is invalid" do
    
    before do
        room.name = ""      
    end

    it "because name is blank" do
      expect(room).to be_invalid
      expect(room.errors[:name]).to include("は1文字以上で入力してください", "を入力してください")
    end
  end

  context "data is invalid" do
    
    before do
        room.name = "あ" * 31
    end

    it "because name limit 30" do
      expect(room).to be_invalid
      expect(room.errors[:name]).to include("は30文字以内で入力してください")
    end
  end
end
