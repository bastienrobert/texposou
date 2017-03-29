Rails.application.routes.draw do

  scope "(:locale)", :locale => /en|fr/ do
    root "places#index"
  end

  resources :participations
  resources :visits
  devise_for :users
  resources :art_tags
  resources :places
  resources :exhibitions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "places#index"

  get "exhibitions/:id/new", to: "exhibitions#new", as: :add_exhibition
  get "visits/:id/new", to: "visits#new", as: :add_visit
  get "participations/:id/new", to: "participations#new", as: :add_participation

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "profile", to: "profile#show", as: :show_profile
  get "profile/edit", to: "profile#edit", as: :edit_profile
  post "profile/update", to: "profile#update", as: :update_profile
  get "profile/:id/show", to: "profile#show_by_id", as: :show_by_id
end
