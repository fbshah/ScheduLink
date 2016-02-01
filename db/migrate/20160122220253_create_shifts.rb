class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
    	t.date          :date
    	t.datetime 		:start_time
    	t.datetime 		:end_time
    	t.string 		:department
    	t.string 		:break
		t.timestamps null: false
    end
  end
end
