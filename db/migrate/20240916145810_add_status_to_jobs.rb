class AddStatusToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :status, :string, default: 'open'
  end
end
