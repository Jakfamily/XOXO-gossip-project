Rails.application.routes.draw do
  get 'pages/secret'
  get 'pages/contact'
  get 'pages/team'
  root 'gossips#index'

  resources :tags
  resources :private_messages
  resources :likes
  resources :gossips do
    post 'like', on: :member
    delete 'dislike', on: :member
  end
  resources :comments
  resources :cities

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  
  get '/contact', to: 'pages#contact'
  get '/secret', to: 'pages#secret'
  get '/team', to: 'pages#team'
  
  namespace :admin do
    get 'dashboard/index'
    resources :users
    resources :gossips
    # Ajoutez d'autres ressources pour l'administration si nécessaire
  end
end

