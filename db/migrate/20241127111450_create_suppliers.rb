class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :company, null: false
      t.string :city
      t.string :address
      t.integer :phone
      t.references :user

      t.timestamps
    end
  end
end
