Rails.application.routes.draw do

  get 'workorders/index'

  get 'workorders/show'

  get 'workorders/new'

  get 'workorders/create'

  get 'workorders/delete'



  devise_for :users
  root to: 'home#index'


  resources :providers do
    resources :workorders, only: [:new, :create, :show]
  end

  resources :users, only: :show do
    resources :workorders, only: [:index, :show, :delete]
  end


  resources :profiles
  resources :settings

end
