Rails.application.routes.draw do
  root to: 'products#home'
  resources :products
  resources :stores
  devise_for :users
  resources :user
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
