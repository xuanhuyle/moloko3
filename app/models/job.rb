class Job < ApplicationRecord
  # A job belongs to a user (customer)
  belongs_to :user

  # A job can have many applicants (lawyers)
  has_many :applications
  has_many :lawyers, through: :applications, source: :user

  # Define job statuses
  def completed?
    status == 'completed'
  end

  def in_progress?
    status == 'in_progress'
  end
end
