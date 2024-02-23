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
    get "/services/myself", to: "services#my_services", as: :my_services
    get "/services/:service_id/slots", to: "slots#get_slots", as: :get_slots
    resources :reviews
    resources :slots
    resources :services
    resources :reservations do
      collection do
        get "/services/:service_id/slots/:slot_id", to: "reservations#reserver", as: :reserver
        get :myself
      end
    end
  end
  get "/recherche/:recherche", to: "pages#recherche", as: :recherche

end
