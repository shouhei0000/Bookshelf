Rails.application.routes.draw do

  get 'readings/create'
  root to: 'toppages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'sigunup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :reads 
  resources :readings
end





