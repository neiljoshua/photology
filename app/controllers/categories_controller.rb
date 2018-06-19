class CategoriesController < ApplicationController

	before_action only: [:show] do
		@back_url = session[:back_path].last
	end

	def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

   def all_photos
    @all_photos = load_photos
    # Will route/url show "category" for all photos page
    # ie category/all or localhost:3000/photos
  end

  def photo
    # @category_photo = load_photos.detect{|photo| photo.id == params[:id] }
    @photo = Photo.find(params[:id])
    # @categpry_photo = load_photos.detect{|photo| photo.id == params[:id]}
    # Why using detect vs find
  end

	def new
		@category = Category.new
	end

	def edit
	  @category = Category.find(params[:id])
	end

	def create
		@category = Category.new(category_params)

		if @category.save
		redirect_to @category
		else
			render 'new'
		end
	end

	def update
	  @category = Category.find(params[:id])

	  if @category.update(category_params)
	    redirect_to @category
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @category = Category.find(params[:id])
	  @category.destroy

	  redirect_to category_path
	end

	private
	  def category_params
	    params.require(:category).permit(:name, :status)
	  end

	  def load_photos
	      Photo.all.order('created_at DESC')
    end

end
