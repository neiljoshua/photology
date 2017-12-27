Rails.application.routes.draw do


	get 'pages/home', to: 'photos#index', as: :home
	get 'pages/about', to: 'pages#about', as: :about

	get 'photos', to: 'photos#new', as: :photos

	get 'signup', to: 'users#new', as: :signup
	get '/users', to: 'users#show', as: :user
	get '/users/:id(.:format)', to: 'users#show', as: :current_user

	get    '/login',   to: 'sessions#new', as: :login
	post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy', as: :logout

	get 'welcome/index'

	resources :users
	resources :sessions
	resources :photos

	resources :articles do
		resources :comments
	end

	resources :galleries do
		resources :images
	end


	root 'pages#home'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
