class CartsProduct < ApplicationRecord
    belongs_to :cart
    belongs_to :product




 # LOGIC
  def subtotal_price
    self.quantity * self.product.price
  end




end
