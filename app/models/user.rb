class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  ROLES = %w[admin slc staff]
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  has_many :shifts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

 def full_name
   return first_name + " " + last_name 
  end 

 acts_as_messageable

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
end
