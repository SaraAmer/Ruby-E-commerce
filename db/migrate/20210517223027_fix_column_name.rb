class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :price, :total
  end
end
