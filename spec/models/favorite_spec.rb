require 'rails_helper'

RSpec.describe Favorite, type: :model do
  
  context "data is valid" do
    
    before do
      @favorite = Favorite.new(
        user_id: 1,
        post_id: 1,
      )
    end
    it "with user_id, post_id" do
      expect(@favorite).to be_valid
    end
  end
end
