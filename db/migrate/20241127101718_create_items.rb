class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :unit, null: false
      t.integer :price, null: false
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
