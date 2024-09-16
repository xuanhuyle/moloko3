class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :expertise
      t.string :urgency
      t.date :timeline
      t.references :user, foreign_key: true # This adds the user_id column

      t.timestamps
    end
  end
end
