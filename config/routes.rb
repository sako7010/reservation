Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users do
    collection do
      get "profile"
    end
  end
  resources :rooms
  resources :bookings do
    collection do 
      get "confirm"
    end
  end
end
