class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Sign-up form for customers
  def new_customer
    build_resource({})
    resource.role = 'customer'
    respond_with resource
  end

  # Sign-up form for lawyers
  def new_lawyer
    build_resource({})
    resource.role = 'lawyer'
    respond_with resource
  end

  protected

  # Permit additional fields based on role
  def configure_permitted_parameters
    if params[:user] && params[:user][:role] == 'lawyer'
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :company_name, :address, :website, :expertise, :role])
    else
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])
    end
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :company_name, :address, :website, :expertise, :role])
  end
end
