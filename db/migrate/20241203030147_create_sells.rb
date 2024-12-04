class CreateSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sells do |t|
      t.date :transaction_date, null: false
      t.integer :total_price, null: false
      t.references :user, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
