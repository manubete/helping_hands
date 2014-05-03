PolarBear::Application.routes.draw do
  root to: "rooms#index"
  resources :users
  resources :rooms
end
