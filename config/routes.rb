Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms
  resources :bookings do
    collection do 
      get "confirm"
    end
  end
end
