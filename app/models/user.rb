class User < ApplicationRecord
	has_many :photos, dependent: :destroy
	has_many :galleries, dependent: :destroy
	attr_accessor :password

	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :name, presence: true,
						length: { maximum: 50 }


	validates :email, presence: true,
						format: { with: email_regex },
						uniqueness: { case_sensitive: false }

	validates :username, presence: true

	validates :password, presence: true,
						confirmation: { case_sensitive: true},
						length: { within: 6..40 }

	before_save :encrypt_password


	# Class method that checks wether the user's email and submitted_password are valid.
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)

		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end

	private
		def encrypt_password
			#Generates a unique salt if it is a unique user
			self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if self.new_record?

			#Encrypt the password and store that in the encrypted password field
			self.encrypted_password = encrypt(password)
		end

		#Encrypt the password using both the salt and the passed password
		def encrypt(pass)
			Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
		end

		def user_params
			params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
		end

end
