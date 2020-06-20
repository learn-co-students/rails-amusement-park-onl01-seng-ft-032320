Rails.application.routes.draw do
  root "sessions#new"
  resources :users
  resources :sessions, only: [:create]
  resources :attractions
  resources :rides
  get '/signin', to: "sessions#new"
  get '/signout', to: "sessions#destroy"


end