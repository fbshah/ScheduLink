class User < ActiveRecord::Base

    mount_uploader :avatar, AvatarUploader


  has_many :shifts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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
