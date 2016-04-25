class User < ActiveRecord::Base

  attr_accessor :login
  ROLES = %w[admin slc staff]
  HOURS = %w[5 10 15 20 30]

  has_many :shifts
  has_many :requests

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable
has_many :events

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

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

  def remaining_hours
      assigned_hours.to_i - shifts.map {|s| s.hours}.inject(0, :+)
  end


end
