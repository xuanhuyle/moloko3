class PagesController < ApplicationController
  # Logged-off homepage
  def home
    if user_signed_in?
      if current_user.role == 'lawyer'
        redirect_to lawyer_home_path
      elsif current_user.role == 'customer'
        redirect_to customer_home_path
      end
    end
  end

  # Lawyer's homepage
  def lawyer_home
    @user = current_user
    @jobs = Job.all
    @cases = @user.cases_as_lawyer
    @clients = @user.clients
  end

  # Customer's homepage
  def customer_home
    @user = current_user
    @jobs = @user.jobs
    @cases = @user.cases_as_customer
    @lawyers = @user.lawyers
  end
end
