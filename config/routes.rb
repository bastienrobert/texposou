Rails.application.routes.draw do



    resources :participations, only: [:index, :show, :create, :edit, :update, :destroy, :confirm, :unconfirm]
    resources :visits, only: [:index, :show, :create, :edit, :update, :destroy]
    devise_for :users, :controllers => {:registrations => "profile"}
    resources :art_tags
    resources :places do
      resources :exhibitions, only: :new
    end
    resources :exhibitions, only: [:index, :show, :create, :edit, :update, :destroy] do
      resources :participations, only: :new
      resources :visits, only: :new
    end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "application#home"
    get "about", to: "application#about", as: :about

    # get "places/:id/exhibitions/new", to: "exhibitions#new", as: :add_exhibition
    # get "visits/:id/new", to: "visits#new", as: :add_visit
    # get "participations/:id/new", to: "participations#new", as: :add_participation
    get "participation/:id/confirm", to: "participations#confirm", as: :confirm_participations
    get "participation/:id/unconfirm", to: "participations#unconfirm", as: :unconfirm_participations

    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
      get "profile/index/:status", to: "profile#index_by_status", as: :index_profile_status
      get "profile", to: "profile#show_profile", as: :show_profile
      post "profile/update", to: "profile#update_profile", as: :update_profile
      get "profile/:id/show", to: "profile#show_by_id", as: :show_by_id
      get "users/sign_up/:status", to: "profile#new", as: :new_user_registration_status
    end

end
