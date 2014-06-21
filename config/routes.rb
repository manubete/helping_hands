PolarBear::Application.routes.draw do

  #routes and roads wont be there, in promise specify how the help can arrive
  root to: "requests#index"

  resources :requests do
    collection do
      get :list
    end
  end


end

