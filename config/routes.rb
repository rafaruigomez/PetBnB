Rails.application.routes.draw do

  # resources :flats
  # devise_for :users, :paths => 'users'
  # resource :user do
  #   resources :flats
  # end
  get 'flats/owned', to: 'flats#owned', as: :owned_flats
  get 'flats/booked', to: 'flats#booked', as: :booked_flats
  devise_for :users
  resources :flats do
    resources :reviews, only: [:new, :create, :index]
  end

  resources :reservations

  root to: 'pages#home'
  # resources :flats


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
