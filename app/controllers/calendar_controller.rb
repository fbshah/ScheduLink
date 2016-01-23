class CalendarController < ApplicationController
	before_action :authenticate
  	def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

  	end

 private 

  	def authenticate
  	 authenticate_user! && current_user.admin?
  	end

end

  end
end

