class ApplicationController < ActionController::Base
  include Pundit
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
    redirect_to edit_user_registration_path if send_to_registration?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:parent_or_student])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :mobile_number])
  end

  def send_to_registration?
    return true if user_signed_in? && current_user.registration_not_complete?
    return true if user_signed_in? && current_user.no_students?
    return false
  end
end
