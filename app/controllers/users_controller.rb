class UsersController < ApplicationController
before_action :correct_user, except: [:show]
before_action :set_user

  def show
    if @user.is_enabled == true
      @lists = List.where(user_id: @user.id)
    else
      flash[:alert] = 'このユーザーは退会済みです。'
      redirect_back(fallback_location: posts_path)
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def withdraw
  end

  def switch
    if @user.update(is_enabled: false)
      sign_out current_user 
    end
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:is_enabled, :name, :profile_image, :background_image, :introduction, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to user_path(current_user)
    end
  end

end
