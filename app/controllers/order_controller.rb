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

       
       puts "++++++++++"
       puts params[:order]["address"]
       puts "++++++++++"
    
       @cart = Cart.find_or_create_by(user: current_user)
       @cart_total = CartsProduct.all
       @products = @cart.products
       @total = 0 ; 
       @products.each do |product|
           @total+= product.carts_products[0].quantity*product.price
       end
       @order =  Order.new(user: current_user ,address: params[:order]["address"] , status: "pending" , total: @total )
       @order.products << @products
       
       if @order.save
        redirect_to  products_path
      else  
        puts "++++++++++"
        @order.errors.each do |e|
          puts e
        end
     
        puts "++++++++++"
      end
       @products.delete_all
       puts "++++++++++"
       puts @order.total
       puts "++++++++++"

       end

      private
      def order_params
      params.require(:order).permit(:address )
      end
    end
    