Rails.application.routes.draw do 
    
    root 'application#welcome'
    resources :users, only: [:new, :create, :show]
    resources :attractions, only: [:new, :create, :index, :show, :edit, :update]
    get "signin", to: "sessions#new"
    post "signin", to: "sessions#create"
    delete "signout", to: "sessions#destroy"
    post "/ride/:id", to: "rides#create", as: "new_ride"
end