class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :summary
      t.datetime :published_at
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
