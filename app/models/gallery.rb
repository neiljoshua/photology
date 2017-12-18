class Gallery < ApplicationRecord
	has_many :images, dependent: :destroy
	validates :title, presence: true,
                    length: {minimum: 5}
end
