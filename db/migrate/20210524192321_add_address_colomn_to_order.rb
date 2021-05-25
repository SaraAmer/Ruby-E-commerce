class AddAddressColomnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address, :string

  end
end
