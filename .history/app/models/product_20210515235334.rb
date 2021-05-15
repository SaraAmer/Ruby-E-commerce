class Product < ApplicationRecord
  has_many :carts
  belongs_to :store
  has_many :orders
  belongs_to :store
  belongs_to :category
  belongs_to :brand
  has_many :productimages
end
