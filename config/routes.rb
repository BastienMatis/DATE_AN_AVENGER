Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:destroy]
  resources :avengers do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: [:destroy]
  get :my_account, to: 'users#my_account'
  resources :bookings, only: [:destroy]
end
