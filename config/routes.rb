Rails.application.routes.draw do


	get '/photos', to: 'photos#index', as: :home
	get 'pages/about', to: 'pages#about', as: :about

	get  '/login', to: 'sessions#new', as: :login
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy', as: :userlogout
	delete '/logout', to: 'sessions#destroy', as: :logout

	get 'user/index', to: 'users#index', as: :users
	get '/user/new', to: 'users#new', as: :signup
	post '/users/', to: 'users#create'
	get '/users/:id', to: 'users#show', as: :user

	get '/photos', to: 'photos#new', as: :photos
	post '/photos', to: 'photos#create'
	get '/photos/:id', to: 'photos#show', as: :showphotos
	get '/photos/:id/edit', to: 'photos#edit', as: :editphotos
	delete'/photos/remover_image/:id(.:fotmat)', to: 'photos#remove_image', as: :remove_image

	resources :sessions

	resources :categories do
		resources :photos
	end

	resources :users do
		resources :photos
	end

	resources :articles do
		resources :comments
	end

	resources :galleries do
		resources :images
	end


	root 'categories#index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
