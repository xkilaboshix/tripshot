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
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'      
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to list_path(@post.list_id)
  end

  private
  def post_params
    params.require(:post).permit(:list_id, :image, :body)
  end
end
