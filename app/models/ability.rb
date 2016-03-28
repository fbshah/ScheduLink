class Ability
  include CanCan::Ability

		def initialize(user)
		 			user ||= User.new
		  		if user.role == "admin"
		  		can :manage, :all
		    elsif
		  		if user.role == "slc"
		  		can :manage, Shift
		  	else
		  		if user.role == "staff"
		  		can :manage, Event
		  		end	
				end
			end
		end
end




