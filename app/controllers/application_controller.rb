class ApplicationController < ActionController::Base
     before_action :authenticate_user!
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    def current_ability
     @current_ability ||= StoreAbility.new(current_user)
   end
#    def index
#      @stores = Store.all
#    end
    protected

         def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :avatar ,:email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :avatar ,:email, :password, :current_password)}
         end
end
