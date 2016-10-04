Rails.application.routes.draw do
  devise_for :walkers
  root to: 'home#index'
  resources :walkers, only: [:show]
  get '/search/', to: 'walkers#search'
end
