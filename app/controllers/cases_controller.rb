class CasesController < ApplicationController
  before_action :authenticate_user!

  def new
    @case = Case.new
  end

  def create
    @case = current_user.cases_as_customer.build(case_params) # Assigns the current user as the customer
    if @case.save
      redirect_to @case, notice: 'Case successfully created.'
    else
      render :new
    end
  end

  def index
    # Show cases for both customers and lawyers, depending on the role of the user
    if current_user.role == 'customer'
      @cases = current_user.cases_as_customer
    elsif current_user.role == 'lawyer'
      @cases = current_user.cases_as_lawyer
    end
  end

  private

  def case_params
    params.require(:case).permit(:title, :description, :location, :expertise, :urgency, :timeline, :lawyer_id) # Include lawyer_id to assign the case to a lawyer
  end
end
