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
        @products= OrderProduct.create()
        @products.quantity=params[:quantity]
        @product=Product.find(params[:product_id])
        @products.order=@order
        
        @products.product=@product
        @products.subtotal= @product.price * @products.quantity
        @products.created_at=Time.now
        @products.updated_at=Time.now
        # puts "hiiiiiiiiiiiiiiiiiiiiiiiiii + #{@products.attributes} +********+#{@products.save}"
        if   @products.save
          redirect_to  root_path
        else
          redirect_to  products_path
        end
    end

  

    private
    def order_params
      params.require(:order).permit(:user_id)
    end
    def orderproducts_params
      params.require(:orderproducts).permit(:quantity)
    end
end
