Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :rides, only: [:index, :new, :create]
  resources :users, only: [:show, :new, :create]
  resources :attractions
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  delete '/logout', to: "sessions#destroy"
end
