class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
    	t.datetime 		:start_time
    	t.datetime 		:end_time
    	t.string 		:department
    	t.datetime 		:break
		t.timestamps null: false
    end
  end
end
