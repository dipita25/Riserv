Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "/slots", to: "slots#index", as: :slots
  # get "slots/new", to: "slots#new", as: :slots_new
  # get "slots/:id", to: "slots#show"
  # post "slots", to: "slots#create"
  # get "slots/:id/edit", to: "slots#edit"
  # patch "slots/:id", to: "slots#update", as: :slot_update
  # delete "slots/:id", to: "slots#destroy", as: :slot_destroy

  resources :enterprises do
    resources :reviews
    resources :slots
    resources :services
    resources :reservations do
      collection do
        get "/services/:id_service/slots/:id_slot", to: "reservations#reserver", as: :reservation
      end
    end
  end

end
