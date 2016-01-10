class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :mobile, :string 
    add_column :users, :address, :string
    add_column :users, :role , :string
    add_column :users, :contract_type, :string
    add_column :users, :assigned_hours, :int
    add_column :users, :NI, :string
    add_column :users, :work_permit, :string
    add_column :users, :employee_no, :string
  end
end
