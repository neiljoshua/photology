class PagesController < ApplicationController

  def home
  	 @photos = Photo.search(params[:title])
  end

  def about
  	@categories = load_categories
  end
end
