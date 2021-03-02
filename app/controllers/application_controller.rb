class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    top_pages_path
  end

  def after_sign_up_path_for(resource)
    top_pages_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def set_user
    @user = User.find_by(public_uid: params[:id])
  end

end
