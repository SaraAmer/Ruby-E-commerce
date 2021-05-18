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
