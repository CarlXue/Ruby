class User < ActiveRecord::Base
	# Validations
 	validates_presence_of :email, :first_name, :last_name, :username, :password
  	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "%{value} is not a valid email" }
  	validates :username, length: { minimum: 3 }
		validates :first_name, format: { with: /[A-z]+/, on: :create, message: "%{value} is not a valid first name"}
	  validates :last_name, format: { with: /[A-z]+/, on: :create, message: "%{value} is not a valid last name"}
		validates :password, length: { minimum: 4 }


	# Users can have interests
	acts_as_taggable_on :interests

	# Use secure passwords
	has_secure_password
	# Find a user by email, then check the username is the same
	def self.authenticate password, email
		user = User.find_by(email: email)
		if user && user.authenticate(password)
			return user
		else
			return nil
		end
	end

	def full_name
		first_name + ' ' + last_name
	end
end
