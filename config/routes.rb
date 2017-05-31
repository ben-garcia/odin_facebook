Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "custom_registration"}

  resources :users,       only: [:index,  :show]
  resources :friendships, only: [:create, :update, :destroy]
  resources :posts,       only: [:index,  :create, :destroy]
  resources :likes,       only: [:create, :destroy]
  resources :comments,    only: [:create, :destroy]

end
