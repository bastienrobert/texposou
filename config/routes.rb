Rails.application.routes.draw do
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
end
