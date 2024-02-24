Rails.application.routes.draw do
  get 'favorites/index'
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

  get "/reservations/", to: "reservations#my_reservations", as: :users_reservations
  get "/favorites", to: "favorites#my_favorites", as: :my_favorites


  resources :enterprises do
    get "/add_to_favorites", to: "enterprises#add_to_favorites", as: :add_to_favorites
    get "/remove_to_favorites", to: "enterprises#remove_to_favorites", as: :remove_to_favorites
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
