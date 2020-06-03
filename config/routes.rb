# frozen_string_literal: true

Rails.application.routes.draw do
  get 'following_books/index'
  resources :reports do
    resources :comments
  end
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
  resources :books do
    resources :comments
  end
  root to: 'books#index'
  resources :relationships, only: %i[create destroy]
end
