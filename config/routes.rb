PolarBear::Application.routes.draw do
  root to: "rooms#index"
  resources :users
  resources :rooms, only: [:show, :index]
  resources :chatrooms, only: [:show]

  get '/room_list', to: 'rooms#room_list'
end

