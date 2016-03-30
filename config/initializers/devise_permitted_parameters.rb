module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) <<:email << :name << :username << :parent_name << :grade << :experience << :mobile_number
    devise_parameter_sanitizer.for(:account_update) <<:email << :name << :username << :parent_name << :grade << :experience << :mobile_number
  end

end

DeviseController.send :include, DevisePermittedParameters
