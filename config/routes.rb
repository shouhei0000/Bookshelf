Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  get 'readings/create'
  root to: 'toppages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'sigunup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end
  resources :reads 
  resources :readings
  resources :willreads
  resources :relationships, only: [:create, :destroy]
end





