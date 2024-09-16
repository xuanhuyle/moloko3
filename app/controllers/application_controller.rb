class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.role == 'lawyer'
      lawyer_home_path
    elsif resource.role == 'customer'
      customer_home_path
    else
      root_path
    end
  end
end
