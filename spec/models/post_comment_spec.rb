require 'rails_helper'

RSpec.describe PostComment, type: :model do
  
  context "data is valid" do
    
    before do
      @post_comment = PostComment.new(
        user_id: 1,
        post_id: 1,
        comment: "hoge" 
      )
    end

    it "with user_id, post_id, comment" do
      expect(@post_comment).to be_valid
    end
  end

  context "data is invalid" do
    
    before do
      @post_comment = PostComment.new(
        user_id: 1,
        post_id: 1,
        comment: "あ" * 101 
      )
    end
    it "because comment limit 100" do
      expect(@post_comment).to be_invalid
      expect(@post_comment.errors[:comment]).to include("は100文字以内で入力してください")
    end
  end

  context "data is invalid" do
    
    before do
      @post_comment = PostComment.new(
        user_id: 1,
        post_id: 1,
        comment: ""
      )
    end
    it "because no comment has been entered" do
      expect(@post_comment).to be_invalid
      expect(@post_comment.errors[:comment]).to include("を入力してください", "は1文字以上で入力してください")
    end
  end
end
