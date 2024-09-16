class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :company_name, :address, :website, :expertise])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :company_name, :address, :website, :expertise])
  end
end
