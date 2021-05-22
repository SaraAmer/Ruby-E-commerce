Rails.application.routes.draw do
  get 'search/',to: 'products#searchedit',as: "searchedit"
  get 'search/filter',to: 'products#search',as: "search"

  root to: 'products#home'
  resources :stores do 
    resources :products do
      member do
        delete :delete_attachment 
        delete :delete_from_cart
        get :add_to_cart
      end
    end
  end  
  devise_for :users
  resources :user do
    resources :cart  , :only =>[:index , :create]
  end

  # get '/cart', to:'order_products#index'
  # resources :order_products , path: '/cart/items'

  resources :order
  devise_for :admin_users, ActiveAdmin::Devise.config
  get "products", to: "products#index" , as: "products"
  ActiveAdmin.routes(self)
 
end
