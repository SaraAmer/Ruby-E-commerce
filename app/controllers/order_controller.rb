class OrderController < ApplicationController
    def index
        @orders = Order.all
      end
    
      def show
        @order = Order.find(params[:id])
      end
    
      def new
        @order = Order.new
      end
      def create 
       @order =  Order.create(order_params)
       @order.status = "pending"
       @cart = Cart.find_or_create_by(user: current_user)
       @cart_total = CartsProduct.all
       @products = @cart.products
       @total = 0 ; 
       @products.each do |product|
           @total+= product.carts_products[0].quantity*product.price
       end
       @order.price = @total
       @cart.products.purge
       puts "++++++++++"
       puts @cart.products
       puts "++++++++++"
       end

      private
      def order_params
      params.require(:order).permit(:address )
      end
    end
    