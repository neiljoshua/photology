module PhotosHelper
	def photos
		@photos = Photo.order('created_at DESC')
 end
end
