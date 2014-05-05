PolarBear::Application.routes.draw do
  root to: "rooms#index"
  resources :users
  resources :rooms, only: [:show]
  resources :chatrooms, only: [:show]
end
