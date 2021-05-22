Rails.application.routes.draw do
  get 'cart/show'
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  root to: 'products#home'
  resources :stores do 
    resources :products do
      member do
        delete :delete_attachment 
      end
    end
  end  
  devise_for :users
  resources :user
  resources :charges

  get '/cart', to:'order_products#index'
  resources :order_products , path: '/cart/items'


  resources :order
  devise_for :admin_users, ActiveAdmin::Devise.config
  get "products", to: "products#index" , as: "products"
  ActiveAdmin.routes(self)
 
end
