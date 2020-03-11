class UsersController < ApplicationController
before_action :correct_user, except: [:show]

  def show
    @user = User.find(params[:id])
    @lists = List.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(set_params)
    respond_to do |format|
      flash[:notice] = "ユーザー情報を更新しました。"
      format.js { render ajax_redirect_to(user_path(current_user.id)) }
    end
    
  end

  def withdraw
    @user = User.find(params[:id])
  end

  def switch
    @user = User.find(params[:id])
    if @user.update(is_enabled: false)
      sign_out current_user 
    end
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:is_enabled, :name, :profile_image, :background_image, :introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to user_path(current_user)
    end
  end

  def ajax_redirect_to(redirect_uri)
    { js: "window.location.replace('#{redirect_uri}');" }
  end

end
