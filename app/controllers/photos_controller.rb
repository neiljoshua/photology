class PhotosController < ApplicationController
	#Index action, photos gets listed in the order at which they were created
 before_action :correct_user, only: [:edit, :update, :destroy]

 def correct_user
	@photo = Photo.find_by(id: params[:id])
	unless current_user?(@photo.user)
		redirect_to user_path(current_user)
	end
 end

 def index
	@photos = Photo.order('created_at DESC')
	@back_url = session[:back_path].last
 end

 def order_cat
	@photos = Photo.all.order('created_at DESC')
 end

 def show
		@photo = Photo.find(params[:id])
		@back_url = session[:back_path].last
 end

 #New action for creating a new photo
 def new
	@user = current_user

	if @user.nil?
		redirect_to login_path
	else
		@photo = @user.photos.new
	end
 end

 def edit
	 @user = current_user
	 @photo = @user.photos.find(params[:id])
	 session[:back_path].pop
 	 @back_url = session[:back_path].pop
 end

 #Create action ensures that submitted photo gets created if it meets the requirements
 def create
	@user = current_user
	@photo = @user.photos.create(photo_params)

	if @photo.save
	 flash.now[:notice] = "Successfully added new photo!"
	 redirect_to @user
	else
	 flash.now[:alert] = "Error adding new photo!"
	 render :new
	end
 end

	def update
		@user = current_user
		@photo = @user.photos.find(params[:id])
		if @photo.update(photo_params)
			session[:back_path].pop
			redirect_to session[:back_path].pop
			byebug
		else
			render 'edit'
		end
	end

	def remove_image
		photo = Photo.where(id: params[:id]).first
		photo.image.destroy
		redirect_to request.referer
	end

 #Destroy action for deleting an already uploaded image
	def destroy
	@user = User.find(params[:user_id])
	@photo = @user.photos.find(params[:id])
		if @photo.destroy
			flash[:notice] = "Successfully deleted photo!"
			redirect_to user_path(@user)
		else
			flash[:alert] = "Error deleting photo!"
		end
	end

 private
 #Permitted parameters when creating a photo. This is used for security reasons.

 def photo_params
	params.require(:photo).permit(:title, :caption, :image, :category_id)
 end

end
