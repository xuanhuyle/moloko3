class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :company_name, :string
    add_column :users, :address, :string
    add_column :users, :website, :string
    add_column :users, :expertise, :string
  end
end
