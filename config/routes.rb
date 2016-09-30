Rails.application.routes.draw do
  root to: 'home#index'
  resources :walkers, only: [:show, :new]
  get '/search/', to: 'walkers#search'
end
