class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  # add_breadcrumb :root
  # def cities
  # 	render json: CS.cities(params[:state], :us).to_json
  # end
 
  def after_confirmation_path_for(resource_name, resource)
    '/'
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:age, :email, :name, :last_name, :phone, :occupation, :bio, :city, :tw, :int, :fb, :provider, :uid, :nickname, :image,:password, :confirm_success_url) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end	
end
