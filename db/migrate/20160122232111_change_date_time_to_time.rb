class ChangeDateTimeToTime < ActiveRecord::Migration
  def change
  	change_column :shifts, :start_time,  :time
  	change_column :shifts, :end_time,  :time
  	change_column :shifts, :break,  :string
  end
end
