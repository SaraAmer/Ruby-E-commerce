class CartController < ApplicationController
def index
    @cart = Cart.find_or_create_by(user: current_user)
    @products = @cart.products
    @total = 0 ; 
    @products.each do |product|
        @total+= product.carts_products[0].quantity*product.price
    end
end
def create
    @product = Product.find(params[:product])
    @cart = Cart.find_or_create_by(user: current_user)
    @cart.products << @product
    
    redirect_to request.referrer
    puts"=============================================="
    puts params[:user_id]
    puts params[:product]
    puts "============================================="
end


end
