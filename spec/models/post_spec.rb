require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) { create(:user) }
  let(:list) { create(:list, user_id: user.id) }
  let(:post) { create(:post, user_id: user.id, list_id: list.id) }
  
  context "data is valid" do

    it "with user_id, list_id, image_id, body" do
      expect(post).to be_valid
    end
  end
end
