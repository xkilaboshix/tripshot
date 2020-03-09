require 'rails_helper'

RSpec.describe Favorite, type: :model do

  let(:user) { create(:user) }
  let(:list) { create(:list, user_id: user.id) }
  let(:post) { create(:post, user_id: user.id, list_id: list.id) }
  let(:favorite) { create(:favorite, user_id: user.id, post_id: post.id) }
  
  context "data is valid" do
    
    it "with user_id, post_id" do
      expect(favorite).to be_valid
    end
  end
end
