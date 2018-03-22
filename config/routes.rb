Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'
  resources :services
  resources :providers
  resources :profiles
  resources :settings

end
