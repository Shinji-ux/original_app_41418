class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|
      t.date :transaction_date, null: false
      t.integer :total_price
      t.references :supplier, null: false, foreign_key: true
      t.timestamps
    end
  end
end
