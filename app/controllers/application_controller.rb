class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :store_back_paths

	def store_back_paths

	  # if session[:back_path] doesn't exist, create it as an empty array

	  session[:back_path] ||= []

	  # add the current path as a new entry in the array

	  session[:back_path] << request.referer

	  # while there are more than five entries, drop the oldest entries
	  # this is to ensure we're not storing too many entries

	  session[:back_path].shift while session[:back_path].count > 5
	end

  include SessionsHelper

end
