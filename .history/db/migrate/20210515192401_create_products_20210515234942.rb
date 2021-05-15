class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.references :store, foreign_key: true
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.float :price
      t.float :rate
      t.integer :quantity

      t.timestamps
    end
  end
end
