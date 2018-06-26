Rails.application.routes.draw do

	root 'categories#index'

	get '/photos', to: 'photos#index', as: :photos
	get '/photo', to: 'photos#new', as: :newphoto
	post '/photos', to: 'photos#create', as: :createphoto
	get '/photos/:id', to: 'photos#show', as: :showphoto
	get '/photos/:id/edit', to: 'photos#edit', as: :editphoto
	delete'/photos/remover_image/:id(.:fotmat)', to: 'photos#remove_image', as: :remove_image

	get '/about', to: 'pages#about', as: :about

	get  '/login', to: 'sessions#new', as: :login
	post '/login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy', as: :userlogout
	delete '/logout', to: 'sessions#destroy', as: :logout

	get 'user/index', to: 'users#index', as: :users
	get '/user/new', to: 'users#new', as: :signup
	post '/user/', to: 'users#create', as: :user_create
	patch '/users/:id/edit', to: 'users#update', as: :user_update
	get '/users/:id', to: 'users#show', as: :user_id
	get '/users/:user_id/photos/:id', to: 'users#photo', as: :users_user_photo

	get 'categories/:id', to: 'categories#show', as: :categoryphotos
	get '/categories/:category_id/photos/:id', to: 'categories#photo', as: :categoryphoto
	resources :sessions

	resources :categories do
		resources :photos
	end

	resources :users do
		resources :photos
	end

	resources :galleries do
		resources :images
	end

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
