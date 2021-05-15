class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category
  belongs_to :brand
  has_many :productimages
end
