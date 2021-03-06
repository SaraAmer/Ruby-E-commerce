Rails.application.routes.draw do
  get 'search/filter',to: 'products#filter',as: "search"
  get 'search/',to: 'products#search',as: "searchedit"
  root to: 'products#home'
  resources :stores do 
    resources :order , :except =>[:create] do 
        get :confirm_order
        get :deliver_order
        get :approved_orders
       
        end
    resources :products do
      member do
        delete :delete_attachment 
        delete :delete_from_cart
        get :add_to_cart
        get :update_cart_quantity
      end
    end
  end  
  resources :order  , :only =>[:index , :create] do 
    get :my_orders
    get :order_details
  end
  devise_for :users
  resources :user do
    resources :cart  , :only =>[:index , :create]
  end



  resources :charges
  # get '/cart', to:'order_products#index'
  # resources :order_products , path: '/cart/items'

  devise_for :admin_users, ActiveAdmin::Devise.config
  get "products", to: "products#index" , as: "products"
  ActiveAdmin.routes(self)
 
end
