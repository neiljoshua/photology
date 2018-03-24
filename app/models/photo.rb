class Photo < ApplicationRecord
	validates :title, presence: true
	belongs_to :user
	belongs_to :category
	# validates :category, presence: true

	#Mounts paperclip image
  has_attached_file :image
  #This validates the type of file uploaded. According to this, only images are allowed.
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(title)
	  if title
	    where('name LIKE ?', "%#{title}%").order('id DESC')
	  else
	    all
	  end
	end

	private
 	#Permitted parameters when creating a photo. This is used for security reasons.
 	def photo_params
  	params.require(:photo).permit(:title, :caption, :image, :category_id)
 	end
end
