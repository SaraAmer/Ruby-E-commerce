Rails.application.routes.draw do
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
  resources :order
  devise_for :admin_users, ActiveAdmin::Devise.config
  get "products", to: "products#index" , as: "products"
  ActiveAdmin.routes(self)
 
end
