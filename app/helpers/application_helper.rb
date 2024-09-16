module ApplicationHelper
  def job_status(job)
    if job.completed?
      "Completed"
    elsif job.in_progress?
      "In Progress"
    else
      "Open"
    end
  end
end
