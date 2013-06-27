class Users < ActiveRecord::Base
	has_secure_password

  attr_accessible :date, :email, :name, :password, :surname, :password_confirmation
before_save { |users| users.email = email.downcase }

validates :name, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
uniqueness: { case_sensitive: false }
 
validates :password, presence: true, length: { minimum: 6 }
validates :password_confirmation, presence: true

end
