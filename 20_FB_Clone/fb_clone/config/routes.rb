Rails.application.routes.draw do
  get 'notifications/index'

  get 'notifications/destroy'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :posts
  root "static_pages#home"
end
