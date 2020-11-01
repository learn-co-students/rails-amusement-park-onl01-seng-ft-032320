Rails.application.routes.draw do
  get "/signup", to: "users#new"
  resources :users
  resources :rides
  resources :attractions
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
