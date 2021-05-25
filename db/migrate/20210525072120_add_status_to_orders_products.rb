class AddStatusToOrdersProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :orders_products, :status, :string , :default => "pending"
  end
end
