class CartController < ApplicationController
def index
    @cart = Cart.find_or_create_by(user: current_user)
   # @product = Product.find(params[:id])
  #  @cart_product=CartsProduct.find(params[:product_id])
  #  @cart_product =@cart.CartsProduct.product_id
    @cart_total = CartsProduct.all
    @products = @cart.products

  #  @total = @cart.product
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
