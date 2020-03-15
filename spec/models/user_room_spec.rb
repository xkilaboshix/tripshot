require 'rails_helper'

RSpec.describe UserRoom, type: :model do
  
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let(:user_room) { create(:user_room, user_id: user.id, room_id: room.id) }

  context "data is valid" do

    it "with user_id, room_id" do
      expect(user_room).to be_valid
    end
  end
end
