Rails.application.routes.draw do
  resources :tags
  resources :private_messages
  resources :likes
  resources :gossips
  resources :comments
  resources :cities
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  # Defines the root path route ("/")
  # root "articles#index"
end
