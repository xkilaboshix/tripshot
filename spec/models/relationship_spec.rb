require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
  context "data is valid" do
    
    before do
      @relationship = Relationship.new(
        user_id: 1,
        follow_id: 1
      )
    end

    it "with user_id, follow_id" do
      expect(@relationship).to be_valid
    end
  end
end
