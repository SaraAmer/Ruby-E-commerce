class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name
      t.datetime :expire_date
      t.integer :expire_counts
      t.float :percentage

      t.timestamps
    end
  end
end
