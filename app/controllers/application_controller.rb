class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  unless Rails.env.production?
    rescue_from Exception,                        with: :_render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :_render_404
    rescue_from ActionController::RoutingError,   with: :_render_404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def set_user
    @user = User.find_by(public_uid: params[:id])
  end

  def _render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e

    if request.format.to_sym == :json
      render json: { error: '404 error' }, status: :not_found
    else
      render 'errors/404', status: :not_found
    end
  end

  def _render_500(e = nil)
    logger.error "Rendering 500 with exception: #{e.message}" if e
    Airbrake.notify(e) if e # Airbrake/Errbitを使う場合はこちら

    if request.format.to_sym == :json
      render json: { error: '500 error' }, status: :internal_server_error
    else
      render 'errors/500', status: :internal_server_error
    end
  end

end
