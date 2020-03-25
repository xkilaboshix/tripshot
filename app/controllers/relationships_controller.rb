class RelationshipsController < ApplicationController

  before_action :set_user, only: [:create, :destroy]

  def index
    user = User.find(params[:user_id])
    @followings = user.followings
    @followers = user.followers
  end

  def create
    following = current_user.follow(@user)
    following.save    
  #   redirect_back(fallback_location: user_path(@user))  
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    # redirect_back(fallback_location: user_path(@user))
  end

  private
  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end
end
