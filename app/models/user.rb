class User < ApplicationRecord
	validates :password, presence: true,
						lenght: {minimum: 8}
	validates :email, presence: true
	has_many :images, dependent: :destroy
end
