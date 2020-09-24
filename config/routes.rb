Rails.application.routes.draw do

  root to: 'toppages#index'

  get 'sigunup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
end
