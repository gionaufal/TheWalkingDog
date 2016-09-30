Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :walkers, only: [:show]
  get '/search/', to: 'walkers#search'
end
