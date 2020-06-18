Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users, only: [:new, :create, :show]
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :attractions
  get '/rides', to: "rides#new"
  post '/rides', to: "rides#create"
end
