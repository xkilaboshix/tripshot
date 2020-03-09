require 'rails_helper'

RSpec.describe UserRoom, type: :model do

  context "data is valid" do
    
    before do
      @user_room = UserRoom.new(
        user_id: 1,
        room_id: 1
      )
    end

    it "with user_id, room_id" do
      expect(@user_room).to be_valid
    end
  end
end
