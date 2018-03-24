class UsersController < ApplicationController

	def index
		if @user.role == 1
	    @users = User.all
	  end
  end

  def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
	  @user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)

		if @user.save
			# byebug
		 #  redirect_to login_path, notice: 'User was successfully created.'
		  sign_in @user
      redirect_to @user, notice: 'User was successfully created.'
		else
			render action:"new"
		end
	end

	def update
	  @user = User.find(params[:id])
	  byebug

	  if @user.update(params)
	    redirect_to @user
	  else
	    render 'edit'
	  end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
	end

end
