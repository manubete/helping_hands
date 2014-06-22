PolarBear::Application.routes.draw do


  root to: "requests#landing_page"

  #requests resources with an api namespace
  #requests are used in both the website and the api

      resources :requests do
        #temporarily adding the list path
        #will later turn this into an ajax call
        collection do
          get :landing_page
          get :api_request
        end
      end


   root to: "requests#landing_page"


end

