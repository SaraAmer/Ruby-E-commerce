class Cart < ApplicationRecord
    has_many :products
    belongs_to :user
end
