PolarBear::Application.routes.draw do
  root :to => 'users#index'
  resources :users
  resources :rooms
end
