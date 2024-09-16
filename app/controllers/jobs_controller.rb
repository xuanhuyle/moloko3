class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  # Marketplace for lawyers to view and filter jobs
  def index
    @jobs = Job.all

    # Apply filters if provided
    if params[:expertise].present?
      @jobs = @jobs.where("expertise ILIKE ?", "%#{params[:expertise]}%")
    end

    if params[:location].present?
      @jobs = @jobs.where("location ILIKE ?", "%#{params[:location]}%")
    end

    if params[:timeline].present?
      @jobs = @jobs.where("timeline >= ?", params[:timeline])
    end
  end

  # Customers can create jobs
  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      redirect_to @job, notice: 'Job listing successfully created.'
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :location, :expertise, :urgency, :timeline)
  end
end
