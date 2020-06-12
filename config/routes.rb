Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#home"
  get '/signin', to: "welcome#signin"
  post '/signin', to: "welcome#create"
  delete '/logout', to: "welcome#destroy"

  resources :rides, only: [:create]
  resources :users, only: [:show, :create, :new]

  resources :attractions, only: [:show, :index, :new, :create, :edit, :update]

end