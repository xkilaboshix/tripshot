class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_enabled, :name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:is_enabled, :name, :profile_image_id, :background_image_id, :introduction])
  end
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      posts_path  # 指定したいパスに変更
    else
      flash[:notice] = "新規登録完了しました。プロフィールを編集してください" 
      edit_user_path(current_user)  # 指定したいパスに変更
    end
  end
end
