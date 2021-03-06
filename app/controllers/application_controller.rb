class ApplicationController < ActionController::Base

    include ApplicationHelper
    #before_action :authenticate_user!
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    def current_ability
     @current_ability ||= Ability.new(current_user)
   end  
    protected
         def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :avatar ,:email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :avatar ,:email, :password, :current_password)}
         end
end
