class CartController < ApplicationController
def index
    ##72ra mn gdwl ap cart products lma al cart id howa al al cart id al mb3ot
    @cart = Cart.find_or_create_by(user: current_user)
   # @product = Product.find(params[:id])
 
    @products = @cart.products
    @cart_product=CartsProduct.where( id: params[:cartid])
    @cart_total = CartsProduct.all
    puts "#######################+#{@cart_product.inspect}"
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
