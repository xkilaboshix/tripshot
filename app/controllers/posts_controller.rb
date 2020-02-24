class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    binding.pry
    @post = Post.new(post_params)
    @post.save
    redirect_to list_path(@post)
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
    params.require(:post).permit(:list_id, :image, :body)
  end
end
