class CartsProduct < ApplicationRecord
    belongs_to :cart
    belongs_to :product
end
public 
# def subtotal_price
#     self.quantity * self.product.price
# end
