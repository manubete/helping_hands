
 HelpingHands::Application.routes.draw do

  get "contact_messages/new"

  get "static_pages/about", to: "static_pages#about", as: :about_static_pages

  get "static_pages/questions", to: "static_pages#questions", as: :questions_static_pages

  get "static_pages/social", to: "static_pages#social", as: :social_static_pages

  get "static_pages/contactTemp", to: "static_pages#contactTemp", as: :contactTemp_static_pages

  get "contact_us/new", to: "contact_us#new", as: :new_contact_us

  get "password_resets/new"

  get "organizations/check_email"

  #requests resources has custom routes, namely donor index and api request, that serve as api endpoints or a route where multiple resources(including donors) are loaded based on a particular requests information and ARecord associations
    resources :requests do
      collection do
        get :api_request
        get :donor_index
      end
    end

     #route for tags-----------------------------------------------
    get 'tags/:tag' => 'requests#index', as: 'tag'


    #routes for contributions, the joint table for requests and donors-------
    resources :contributions

    #added routes for the sessions------------------------------------
     resources :sessions do
      collection do
        get :user_type_confirmation
        get :user_type_login_confirmation
        get :find_security_question
        get :security_question
        get :verify_security_question
      end
    end

    #added log in and log out routes
    get "log_out" => "sessions#destroy", :as => "log_out"
    get "log_in" => "sessions#user_type_login_confirmation", :as => "log_in"

    #renamed some of the paths for clarity----------------------------------
    resources :donors, :controller => "donors", :path_names => { :new => "sign_up"}
    resources :organizations, :controller => "organizations", :path_names => { :new => "sign_up"}
    resources :contact_messages

   root to: "requests#landing_page"

   #added routes for donor or organization password resets--------------------------------------
   resources :password_resets

   resources :static_pages

   resources :contactUs
end
