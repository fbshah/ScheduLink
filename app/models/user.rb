class User < ActiveRecord::Base
validates :first_name, presence: { message: "first name can't be blank" }
validates_length_of :first_name, within: 2..20, too_long: 'too long', too_short: 'too short'
validates :last_name, presence: { message: "last name can't be blank" }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: {message: "please type email with an @ sign"}, length: { maximum: 255 },
          format: { with: VALID_EMAIL_REGEX }, 
          uniqueness: { case_sensitive: false }



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
  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end
end
