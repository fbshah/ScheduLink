class Shift < ActiveRecord::Base
	
	belongs_to :user
	validates :date, uniqueness: { scope: :user, message: "has already been taken for this user" }
	validate :min_two_hour

	def min_two_hour
		if Time.diff(start_time, end_time)[:hour] < 2
			errors.add(:end_time, "minimum two hour shift")
		end
	end

	def hours
		Time.diff(start_time, end_time)[:hour]
	end
end
