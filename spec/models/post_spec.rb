require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }

  context "data is valid" do
    
    before do
      @post = Post.new
      @post.user_id = 1
      @post.list_id = 1
      @post.image_id = Rack::Test::UploadedFile.new(image_path)
      @post.body = "hoge"
    end

    it "with user_id, list_id, image_id, body" do
      expect(@post).to be_valid
    end
  end
end
