class Product < ApplicationRecord
  has_many :carts
  has_many :order_products
  belongs_to :store
  belongs_to :category
  belongs_to :brand
  has_many_attached :images

  def role_symbols
    [role.to_sym]
  end
end
