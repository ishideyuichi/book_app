Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :only => [:show]
end
