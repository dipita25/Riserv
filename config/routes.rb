Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # delete "service/:id", to: "service#destroy", as: :destroy_service
  # root "service#index"
  get "service", to: "service#index"
  # get "service/new", to: "service#new", as: :new_service
  # get "service/:id", to: "service#show", as: :service
  # post "service/", to: "service#create"
  # get "service/:id/edit", to: "service#edit", as: :edit_service
  # patch "service/:id", to: "service#update", as: :update_service
  resources :services
end
