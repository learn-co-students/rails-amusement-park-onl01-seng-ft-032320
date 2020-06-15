Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:new, :create, :index, :show, :edit, :update]
  # resources :admins, only: [:new, :create, :show]
  
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  post "/ride/:id", to: "rides#create", as: "new_ride"

  

  
  

end



