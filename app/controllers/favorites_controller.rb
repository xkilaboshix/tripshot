class FavoritesController < ApplicationController
  def index
      active_post_id = Post.where(user_id: active_user_id)
      @favorites = Favorite.where(user_id: params[:user_id], post_id: active_post_id).page(params[:page]).per(9).reverse_order
  end

  def create
    @post = Post.find(params[:post_id])
    favorite = Favorite.new(post_id: @post.id)
    favorite.user_id = current_user.id
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
    render :create
  end

end
