require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
  let(:user) { create(:user) }
  let(:relationship) { create(:relationship, user_id: user.id) }
  context "data is valid" do

    it "with user_id, follow_id" do
      expect(relationship).to be_valid
    end
  end
end
