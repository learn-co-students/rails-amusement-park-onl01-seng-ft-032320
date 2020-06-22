Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#new"
  resources :users
  resources :sessions, only: [:create]
  resources :attractions
  resources :rides
  get '/signin', to: "sessions#new"
  get '/signout', to: "sessions#destroy"



end
