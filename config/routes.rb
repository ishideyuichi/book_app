Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :only => [:show]
  root to: 'books#index'
end
