class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to list_path(@post.list_id)
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
