Rails.application.routes.draw do
  get 'cart/show'
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  root to: 'products#home'
  resources :products
  resources :stores
  devise_for :users
  resources :user

  get '/cart', to:'order_products#index'
  resources :order_products , path: '/cart/items'


  resources :order
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
