class Users::RegistrationsController < Devise::RegistrationsController
  def create
    if params[:sns_auth] == "true"
      pass = Devise.friendly_token.first(8)
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end
end