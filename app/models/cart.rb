class Cart < ApplicationRecord
    has_many :carts_products
    has_many :products , through: :carts_products
    belongs_to :user

  # LOGIC
  def total
    sum = 0
    self.carts_products.each do |cart_product|
      sum+= cart_product.subtotal_price
    end
    return sum
  end


end
