Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  delete "slots/:id", to: "slots#destroy", as: :slot_destroy
  get "/slots", to: "slots#index", as: :slots
  get "slots/new", to: "slots#new", as: :slots_new
  post "slots", to: "slots#create"
  get "slots/:id", to: "slots#show"
end
