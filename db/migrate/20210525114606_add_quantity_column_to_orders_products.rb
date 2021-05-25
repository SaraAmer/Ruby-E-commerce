class AddQuantityColumnToOrdersProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :orders_products, :quantity, :integer , :default => 1
  end
end
