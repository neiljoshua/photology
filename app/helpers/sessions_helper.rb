module SessionsHelper

	def sign_in(user)
		session[:user_id] = user.user_id
		self.current_user = user
	end

	#setter method
	def current_user(user)
		@current_user = user
	end

	#Getter method
	def current_user(user)
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def signed_in?
		!current_user.nill
	end

	def sing_out
		session[:user_id] = nill
		self.current_user = nill
	end

	def current_user?(user)
		user == current_user
	end

	def deny_access
		redirect_to user_login_path, :notice => "Please sign in to access this page"
	end

end
