PolarBear::Application.routes.draw do

  #routes and roads wont be there, in promise specify how the help can arrive
  root to: "rooms#index"
  resources :rooms, only: [:show, :index]
  resources :chatrooms, only: [:show]

  get '/room_list', to: 'rooms#room_list'
end

