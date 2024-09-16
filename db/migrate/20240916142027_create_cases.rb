class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }   # Reference to the user (customer)
      t.references :lawyer, null: false, foreign_key: { to_table: :users } # Reference to the lawyer (still in the users table)

      t.string :title
      t.text :description
      t.string :location
      t.string :expertise
      t.string :urgency
      t.date :timeline

      t.timestamps
    end
  end
end
