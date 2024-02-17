Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "services#index"
  # get "services", to: "services#index"
  # get "services/:id", to: "services#show"
  # get "services/new", to: "services#new"
  # post "services", to: "services#create"
  # get "services/:id/edit", to: "services#edit"
  # delete "services/:id", to: "services#destroy"
  resources :services
end
