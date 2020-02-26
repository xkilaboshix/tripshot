class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
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
