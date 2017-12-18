Rails.application.routes.draw do

  get 'pages/home', to: 'pages#home', as: :home

  get 'pages/about', to: 'pages#about', as: :about

  get 'images', to: 'images#index', as: :images

  get 'welcome/index'

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
