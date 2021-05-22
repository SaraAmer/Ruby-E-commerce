class CartController < ApplicationController
        #To show cart
       #/cart/cartId => find or create
    #Cart.create(user_id: 1, product_id: 1)
       #get "cart/:id" , to: "cart#add" , as: "add_cart"
       def add
        @product = Product.find(params[:id])
        Cart.create(user: current_id, product: @product)
        
       end
end
