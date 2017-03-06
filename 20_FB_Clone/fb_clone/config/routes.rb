Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :notifications, only: [:index, :destroy]
  resources :likes, only: [ :create, :destroy ]
  resources :users, only: [ :show ]
  resources :friendships, only: [ :create, :update, :destroy ]
  resources :posts
  root "static_pages#home"
end
