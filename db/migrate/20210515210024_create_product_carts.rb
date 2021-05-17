class CreateProductCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :product_carts do |t|

      t.timestamps
    end
  end
end
