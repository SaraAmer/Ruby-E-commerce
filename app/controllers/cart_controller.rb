class CartController < ApplicationController
def index
    @cart = Cart.find_or_create_by(user: current_user)
    @products = @cart.products
end
def create
    @product = Product.find(params[:product])
    @cart = Cart.find_or_create_by(user: current_user)
    @cart.products << @product
    puts"=============================================="
    puts params[:user_id]
    puts params[:product]
    puts "============================================="
end


end
