Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users do
    resources :following, only: :index
    resources :followers, only: :index
  end
  resources :books
  root to: 'books#index'
  resources :relationships, only: [:create, :destroy]
end
