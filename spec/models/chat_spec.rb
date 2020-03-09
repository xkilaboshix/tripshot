require 'rails_helper'

RSpec.describe Chat, type: :model do

    let(:user) { create(:user) }
    let(:room) { create(:room) }
    let(:chat) { create(:chat, user_id: user.id, room_id: room.id) }

    context "data is valid" do

      it "with user_id, room_id, message" do
        expect(chat).to be_valid
      end
    end

    context "data is invalid" do
      
      before do

        chat.message = ""
      end

      it "because message is blank" do
        expect(chat).to be_invalid
        expect(chat.errors[:message]).to include("は1文字以上で入力してください")
      end
    end

    context "data is invalid" do
      
      before do
        chat.message = "a" * 141
      end

      it "because message limit 140" do
        expect(chat).to be_invalid
        expect(chat.errors[:message]).to include("は140文字以内で入力してください")
      end
    end
  
  
end
