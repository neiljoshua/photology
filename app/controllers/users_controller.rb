class UsersController < ApplicationController
<<<<<<< HEAD
	# before_action :set_user, only: [:show, :edit, :update, :destroy]

=======
	before_action :set_user, only: [:show, :edit, :update, :destroy]
>>>>>>> b53b7d9534e8315f3b0bca521a11e833b7b7b599
	def index
    @users = User.all
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
<<<<<<< HEAD
		redirect_to images_path
=======
		redirect_to @user
>>>>>>> b53b7d9534e8315f3b0bca521a11e833b7b7b599
		else
			render 'new'
		end
	end

	def update
	  @user = User.find(params[:id])

	  if @user.update(user_params)
	    redirect_to @user
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @user = User.find(params[:id])
	  @user.destroy

	  redirect_to users_path
	end

	private
  def user_params
<<<<<<< HEAD
    params.require(:user).permit(:name, :email, :username, :password)
=======
    params.require(:user).permit(:title, :text)
>>>>>>> b53b7d9534e8315f3b0bca521a11e833b7b7b599
  end

end
