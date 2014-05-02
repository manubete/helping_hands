PolarBear::Application.routes.draw do
  root to: "rooms#index"
  resources :users, only: [:create]
end
