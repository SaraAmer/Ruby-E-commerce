class Product < ApplicationRecord
    has_many :carts
   belongs_to :store
  has_many :orders
end
