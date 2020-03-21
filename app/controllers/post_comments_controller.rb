class PostCommentsController < ApplicationController
  
  def create 
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.post_id = params[:post_id]
    @post_comment.save  
    @post = Post.find(params[:post_id])
  end
  
  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:user_id, :post_id, :comment)
  end
end
