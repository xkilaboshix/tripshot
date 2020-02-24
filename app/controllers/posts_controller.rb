class PostsController < ApplicationController
  def index
    
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.list_id = session[:list_id]
    @post.save
  end
  def show
    
  end
  def edit
    
  end
  def update
    
  end
  def destroy
    
  end

  private
  def post_params
    params.require(:post).permit(:list_id, :image_id, :body)
  end
end
