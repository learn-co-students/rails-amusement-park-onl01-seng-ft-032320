Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:create, :destroy]
  get "signin", to: "sessions#new"
  
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]

  resources :rides, only: [:create, :new]

  root "welcome#home"
end
