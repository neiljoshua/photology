class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
		 redirect_to @user, notice: 'User was successfully created.'
		else
			# render :text => "here"
			render action:"new"
		end
	end

	def show
		# byebug
		# @user = User.find(params[user_id])

	end

	private
	def user_params
			params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
		end

end
