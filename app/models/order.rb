class Order < ApplicationRecord
    has_many :order_product
    belongs_to :user   
end
