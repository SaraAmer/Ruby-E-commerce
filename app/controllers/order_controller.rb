class OrderController < ApplicationController
    def index
      if params[:store_id] 
        @store = Store.find(params[:store_id])
        @orders = OrdersProduct.all
        
      else     
        @orders = Order.all
      end  
      end
    
      def show
        @order = Order.find(params[:id])
      end
    
      def new
        @order = Order.new
      end
      def create     
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
        @order.orders_products.each do|orders_product|
          @cart.carts_products.each do |cart_product|
           if cart_product.product == orders_product.product
            orders_product.update(quantity: cart_product.quantity )
            quantity = cart_product.product.quantity
            orders_product.product.update(quantity: quantity-cart_product.quantity)
           end
          end
        end

        @products.delete_all
        redirect_to  products_path
      else  
        
        @order.errors.each do |e|
          puts e
        end
     
      end

       end

      def approved_orders
        if params[:store_id] 
          @store = Store.find(params[:store_id])
          @orders = OrdersProduct.all
          
        else     
          @orders = Order.all
        end  

        render "approved"
        end


      def confirm_order
        puts "++++++++++"
        puts params[:order_id]
        puts "++++++++++"
 
        @order = OrdersProduct.find(params[:order_id])
        @order.update(status: "confirmed")
        redirect_to request.referrer
      end
      def deliver_order
        @order = OrdersProduct.find(params[:order_id])
        @order.update(status: "delivered")
        redirect_to request.referrer
      end
      def my_orders 
        @orders  = Order.where(user:current_user)
        render "userorder"
      end
      def order_details
        @order = Order.find(params[:order_id])
        @products = @order.orders_products
        render "orderdetails"
      end
        private
      def order_params
      params.require(:order).permit(:address )
      end
    end
    