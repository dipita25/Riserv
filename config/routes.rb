Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
<<<<<<< HEAD
  root to: "services#index"
  # get "services", to: "services#index"
  # get "services/:id", to: "services#show"
  # get "services/new", to: "services#new"
  # post "services", to: "services#create"
  # get "services/:id/edit", to: "services#edit"
  # delete "services/:id", to: "services#destroy"
=======
  # root "articles#index"

  # get "/slots", to: "slots#index", as: :slots
  # get "slots/new", to: "slots#new", as: :slots_new
  # get "slots/:id", to: "slots#show"
  # post "slots", to: "slots#create"
  # get "slots/:id/edit", to: "slots#edit"
  # patch "slots/:id", to: "slots#update", as: :slot_update
  # delete "slots/:id", to: "slots#destroy", as: :slot_destroy
  resources :slots
  resources :reservations
>>>>>>> master
  resources :services
end
