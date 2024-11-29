class CreateBuyItems < ActiveRecord::Migration[7.0]
  def change
    create_table :buy_items do |t|
      t.integer :quantity, null: false
      t.integer :item_price, null: false
      t.references :buy, null: false
      t.references :item, null: false

      t.timestamps
    end
  end
end
