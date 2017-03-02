Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :notifications, only: [:index, :destroy]
  resources :users, only: [ :show ]
  resources :friendships, only: [ :create, :update, :destroy ]
  resources :posts
  root "static_pages#home"
end
