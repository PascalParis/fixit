Rails.application.routes.draw do

  get 'workorders/index'

  get 'workorders/show'

  get 'workorders/new'

  get 'workorders/create'

  get 'workorders/delete'

  devise_for :users
  root to: 'home#index'
  resources :services
  resources :providers
  resources :profiles
  resources :settings

end
