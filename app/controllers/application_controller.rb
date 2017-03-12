class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :collect_user_information, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    courses_path
  end

  protected

  def collect_user_information
    redirect_to edit_user_registration_path if user_signed_in? && current_user.user_missing_info?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :parent_or_student)
    end
  end
end
