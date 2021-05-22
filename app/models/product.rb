class Product < ApplicationRecord
  has_many :carts_products
  has_many :carts , through: :carts_products
  has_many :order_products
  belongs_to :store
  belongs_to :category
  belongs_to :brand
  has_many_attached :images
end
