class AddEmployeeNoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :employee_no, :string
    add_index :users, :employee_no, unique: true
  end
end
