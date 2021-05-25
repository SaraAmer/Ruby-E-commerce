class Order < ApplicationRecord
    has_many :orders_products
    has_many :products , through: :orders_products
    belongs_to :user   

 
    # before_save :set_subtotal
    # accepts_nested_attributes_for :payment     
    # def subtotal
    #     order_products.collect{|order_product| order_product.valid? ? order_product.unit_price*order_product.quantity : 0}.sum
    # end

    # private

    # def set_subtotal
    #     self[:subtotal] = subtotal
    # end

end
