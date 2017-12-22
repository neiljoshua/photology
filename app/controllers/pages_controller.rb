class PagesController < ApplicationController
  def home
  	# @images = Image.all
  	@photos = Photo.all
  end

  def about
  end
end
