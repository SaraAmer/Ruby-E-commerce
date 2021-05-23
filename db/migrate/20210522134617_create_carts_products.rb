class CreateCartsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts_products do |t|
      t.belongs_to :product
      t.belongs_to :cart
      t.timestamps
    end
  end
end
