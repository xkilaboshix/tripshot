require 'rails_helper'

RSpec.describe PostComment, type: :model do

  let(:user) { create(:user) }
  let(:list) { create(:list, user_id: user.id) }
  let(:post) { create(:post, user_id: user.id, list_id: list.id) }
  let(:post_comment) { create(:post_comment, user_id: user.id, post_id: post.id) }
  
  context "data is valid" do

    it "with user_id, post_id, comment" do
      expect(post_comment).to be_valid
    end
  end

  context "data is invalid" do
    
    before do
        post_comment.comment =  "あ" * 101 
    end

    it "because comment limit 100" do
      expect(post_comment).to be_invalid
      expect(post_comment.errors[:comment]).to include("は100文字以内で入力してください")
    end
  end

  context "data is invalid" do
    
    before do
        post_comment.comment = ""
    end
    
    it "because no comment has been entered" do
      expect(post_comment).to be_invalid
      expect(post_comment.errors[:comment]).to include("を入力してください", "は1文字以上で入力してください")
    end
  end
end
