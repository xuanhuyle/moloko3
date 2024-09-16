class Application < ApplicationRecord
  belongs_to :job
  belongs_to :user  # This represents the lawyer applying for the job
end
