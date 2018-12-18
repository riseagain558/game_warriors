Rails.application.routes.draw do
  root 'home#index'

  resources :sessions, only: [:create]
  resources :warriors, only: [:create]
  
  get 'signup', to: 'warriors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
