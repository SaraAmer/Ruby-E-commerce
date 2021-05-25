class OrderProduct < ApplicationRecord
    belongs_to :product
    belongs_to :order
    belongs_to :user    
    before_save :set_unit_price
    before_save :set_total
 

    def unit_price
        if persisted?
            self[:unit_price]
        else
            product.price
        end
    end


    def subtotal
        order_products.collect{|order_product| order_product.valid? ? order_product.unit_price*order_product.quantity : 0}.sum
    end

    private

    def set_subtotal
        self[:subtotal] = subtotal
    end

    
    def set_unit_price
        self[:unit_price] = unit_price 
    end

   

end
