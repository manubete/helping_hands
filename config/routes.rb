PolarBear::Application.routes.draw do

  #requests resources has custom routes that serve as a landing page, API endpoints and a user type confirmation for registration as both a donor or an organization
    resources :requests do
      collection do
        get :api_request
      end
    end

    resources :contributions

    #route for tags
    get 'tags/:tag' => 'requests#index', as: 'tag'

    #added routes for the sessions
     resources :sessions do
      collection do
        get :user_type_confirmation
        get :user_type_login_confirmation
        get :new_donor
        get :new_organization
      end
    end

    #added log in and log out routes
    get "log_out" => "sessions#destroy", :as => "log_out"
    get "log_in" => "sessions#user_type_login_confirmation", :as => "log_in"

    #renames some of the paths for clarity
    resources :donors, :controller => "donors", :path_names => { :new => "sign_up"}
    resources :organizations, :controller => "organizations", :path_names => { :new => "sign_up"}

   root to: "requests#landing_page"


end

