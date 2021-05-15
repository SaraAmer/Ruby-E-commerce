json.extract! product, :id, :name, :store_id, :category_id, :price, :rate, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
