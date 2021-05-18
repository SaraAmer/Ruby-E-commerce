class AddSubtotalToTablename < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :subtotal, :float
  end
end
