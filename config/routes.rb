Rails.application.routes.draw do
  # Devise routes for users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Root route to the homepage
  root 'pages#home'

  # Routes for jobs
  resources :jobs

  # Routes for messaging
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
end
