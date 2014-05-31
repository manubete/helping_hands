PolarBear::Application.routes.draw do

  #routes and roads wont be there, in promise specify how the help can arrive
  root to: "promises#index"
  resources :promises

end

