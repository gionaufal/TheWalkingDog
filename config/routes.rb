Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :dogs, only: [:new]
  root to: 'home#index'
  resources :walkers, only: [:show]
  get '/search/', to: 'walkers#search'
end
