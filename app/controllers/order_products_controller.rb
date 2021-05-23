class OrderProductsController < ApplicationController
    def index
        @items=OrderProduct.all
    end
    def new

    end
    def create 
       @order = Order.find_or_create_by(user: current_user)
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
