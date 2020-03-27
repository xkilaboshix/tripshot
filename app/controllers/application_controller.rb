class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_enabled, :name ])
  end

  # 有効なユーザーのidを取得
  def active_user_id
    active_user_id = User.where(is_enabled: true).pluck(:id)
    return active_user_id
  end

end
