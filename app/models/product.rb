class Product < ApplicationRecord
  has_many :carts_products
  has_many :carts , through: :carts_products
  has_many :orders_product
  belongs_to :store
  belongs_to :category
  belongs_to :brand
  has_many_attached :images
  validates :images, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :quantity, presence: true

  def role_symbols
    [role.to_sym]
  end

  def self.category_options
    @category = Category.all
    @category.compact.each_with_index.map { |category, i| ["#{category.name}", i+1]}
    
    end

    def self.brand_options
      @brand = Brand.all
      @brand.compact.each_with_index.map { |brand, i| ["#{brand.name}", i+1]}
      
      end
end
