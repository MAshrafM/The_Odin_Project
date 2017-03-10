Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :notifications, only: [:index, :destroy]
  resources :likes, only: [ :create, :destroy ]
  resources :users, only: [ :show, :index ] do 
    member do
      get :friends, :requests
    end
  end
  resources :friendships, only: [ :create, :update, :destroy ]
  resources :posts
  resources :comments, only: [ :create, :destroy, :update ]
  
  authenticated :user do
    root to: 'static_pages#home', as: :authenticated_root
  end
  root to: "static_pages#intro"
end
