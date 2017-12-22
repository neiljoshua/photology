class User < ApplicationRecord
	# validates :password, presence: true
	# validates :email, presence: true
	has_many :photos
	attr_accessor :password
	# attr_accessible :name, :email, :password, :password_confirmation

	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :name, presence: true,
						length:	{ :maximun => 50 }

	validates :email, presence: true,
						format: { :with => email_regex },
						uniqueness: { :case_sensitive => false }

	validates :password, presence:true,
						confirmation: true,
						length: { :within => 6..40 }

	before_save :encrypt_password

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)

		return nil if user.neil?
		return user if user.has_password?(submitted_password)
	end

	private
		def encrypt_password
			#Generates a unique salt if it is a unique user
			self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if self.new_record?

			#Encrypt the password and store that in the encrypted password field
			sel.encrypted_password = encrypt(password)
		end

		#Encrypt the password using both the salt and the passed password
		def encrypt(pass)
			Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
		end

end
