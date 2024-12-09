class CreateSellItems < ActiveRecord::Migration[7.0]
  def change
    create_table :sell_items do |t|
      t.integer :quantity, null: false
      t.integer :item_price, null: false
      t.integer :item_total_price, null: false
      t.references :sell, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
