Rails.application.routes.draw do
  # Devise routes for users (authentication)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Custom routes for customer and lawyer sign-up inside devise_scope
  devise_scope :user do
    get 'customers/sign_up', to: 'users/registrations#new_customer', as: :new_customer_registration
    get 'lawyers/sign_up', to: 'users/registrations#new_lawyer', as: :new_lawyer_registration
  end

  # Root route (home for logged-off users)
  root 'pages#home'

  # Routes for jobs
  resources :jobs, only: [:index, :new, :create, :show]

  # Routes for finding lawyers
  get 'find_lawyers', to: 'users#index', as: :find_lawyers

  # Routes for messaging
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  # Routes for cases
  resources :cases, only: [:index, :new, :create]

  # Custom homepages for logged-in users
  get 'lawyer_home', to: 'pages#lawyer_home', as: :lawyer_home
  get 'customer_home', to: 'pages#customer_home', as: :customer_home
end
