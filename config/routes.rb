Rails.application.routes.draw do
  root to: 'home#index'
  resources :walkers, only: [:show]
  get '/search/', to: 'walkers#search'
end
