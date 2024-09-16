class UsersController < ApplicationController
  def index
    @users = User.where(role: 'lawyer')

    if params[:expertise].present?
      @users = @users.where("expertise ILIKE ?", "%#{params[:expertise]}%")
    end

    if params[:location].present?
      @users = @users.where("address ILIKE ?", "%#{params[:location]}%")
    end
  end
end
