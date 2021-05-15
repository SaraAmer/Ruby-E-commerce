class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :categoryname
      t.string :brandname
      t.integer :rate
      t.integer :storeid

      t.timestamps
    end
  end
end
