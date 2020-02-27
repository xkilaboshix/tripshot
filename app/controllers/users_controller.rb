class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lists = List.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました！"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def withdraw
    @user = User.find(params[:id])
  end

  def switch
    @user = User.find(params[:id])
    if @user.update(is_enabled: false)
      sign_out current_user #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
    end
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:is_enabled, :name, :profile_image, :background_image, :introduction)
  end
end
