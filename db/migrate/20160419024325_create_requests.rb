class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
        t.date          :date
    	t.datetime 		:start_time
    	t.datetime 		:end_time
    	t.string 		:department
    	t.string 		:break
    	t.integer		:user_id
    end
  end
end
