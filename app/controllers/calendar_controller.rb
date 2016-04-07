class CalendarController < ActionController::Base


def shifts
	@shifts = @user.shifts
end

def show
end

end
