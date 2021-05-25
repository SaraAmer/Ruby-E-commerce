class OrdersProduct < ApplicationRecord
    belongs_to :product
    belongs_to :order
  

    after_update do
        @order = Order.find(self.order_id)
        @products = OrdersProduct.where(order: @order)
        if   self.status == "confirmed"

        @order_status = "confirmed"    
        @products.each do |product|  

          if product.status != "confirmed"
            @order_status = "pending" 
          end
       
        end
        @order.update(status:  @order_status )
        puts "=======================confirmed============="
        puts @order.status
        puts "===================================="
        
    
        elsif self.status == "delivered"

            @order_status = "delivered" 
            @products.each do |product|  
                
            if product.status != "delivered"
                  @order_status = "pending" 
            end
           end
           @order.update(status:  @order_status )
           puts "=======================delivered============="
           puts @order.status
           puts "===================================="
        end
 
    
    end
end
