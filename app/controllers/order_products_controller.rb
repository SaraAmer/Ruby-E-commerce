class OrderProductsController < ApplicationController
    #  # cart belongs to which order 
    #  def initialize(current_user.id:)
    #     @userid=current_user.id
    # end
    # #initialize Order
    # def order
    #     @order ||= Order.find_or_create_by(current_user.id: @userid ) do |order|
    #         order.total=0
    #     end 
    # end
    # #add product in order_products
    # def add_item( product_id: , quantity:1 )
    #     product=Product.find(product_id)
    #     order_item= order_products.find_or_create_by(
    #         product_id: product_id
    #     )
    #     #take product price from product table
    #     order_item.subtotal=product.price
    #     #take quantity which they choose
    #     order_item.quantity=quantity
    #     #save product in database
    #     order_item.save
    # end    

    def index
        @items=OrderProduct.all
    end
    def new

    end
    def create
            # redirect new_order_product_path        
        # current_cart.additem(
        #     product_id: params[:product_id],
        #     quantity: params[:quantity]
        # )
        # redirect_to  cart_path
                                 #   @order = Order.find_or_create_by(user: current_user)
        ###if lw msh mwgod w 7y3mlo create order 
        ##if mwgod 
        @order=current_order
        @order_product=@order.order_product.new(order_params)

        @order.save
          session[:order_id]=@order.id
    end

  

    # private
    # def order_params
    #   params.require(:order).permit(:user_id)
    # end
    # def orderproducts_params
    #   params.require(:orderproducts).permit(:quantity)
    # end

private
    def order_params
        params.require(:order_product).permit(:order_id,:product_id,:quantity)
    end

end
