class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])

  	if user.nil?
  		flash.now[:notice] = "Invalid Email/Password combination."
    	render 'new'
    else
    sign_in user
    redirect_to user
    end

  end

  def destroy
  	sign_out
  	redirect_to login_path
  end

end
