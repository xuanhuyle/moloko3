class Users::RegistrationsController < Devise::RegistrationsController
  def new_customer
    # Custom logic for customer registration
    build_resource
    resource.role = 'customer' # Set role as customer
    respond_with resource
  end

  def new_lawyer
    # Custom logic for lawyer registration
    build_resource
    resource.role = 'lawyer' # Set role as lawyer
    respond_with resource
  end
end
