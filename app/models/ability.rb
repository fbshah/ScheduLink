class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
      can :manage, :all if user.role == "admin"
  	else
  	  can :manage, Shift if user.role == "slc"
  end
end

