Rails.application.routes.draw do

  devise_for :users
  resources :art_tags
  resources :places
  resources :exhibitions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "places#index"

  get "places/:id/new", to: "exhibitions#new", as: :add_exhibition
end
