Rails.application.routes.draw do
  devise_for :walkers
  devise_for :users
  scope 'meu-perfil' do
    resources :dogs, only: [:new, :create]
  end
  root to: 'home#index'
  resources :walkers, only: [:show] do
    resources :proposals, only: [:new, :create]
  end
  get '/search/', to: 'walkers#search'
  get '/meu-perfil', to: 'profiles#my_profile', as: 'my_profile'
  get "/profile/:id", to: 'profiles#show', as: 'profile'
end
