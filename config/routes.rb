Rails.application.routes.draw do

	get 'sessions/new'

	get 'pages/home', to: 'photos#index', as: :home

	get 'pages/about', to: 'pages#about', as: :about

	get 'photos', to: 'photos#new', as: :photos

	get 'usersnew', to: 'users#new', as: :user_new

	get 'user', to: 'users#show', as: :user

	#get 'userslogin', to: 'users#login', as: :user_login

	get    '/login',   to: 'sessions#new', as: :user_login

	post   '/login',   to: 'sessions#create'

	delete '/logout',  to: 'sessions#destroy'

	get 'welcome/index'

	resources :photos

	resources :articles do
		resources :comments
	end

	resources :galleries do
		resources :images
	end

	resources :users

	root 'pages#home'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
