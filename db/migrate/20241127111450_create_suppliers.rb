class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :company, null: false
      t.string :city
      t.string :address
      t.string :phone
      t.references :user
      t.string :bank
      t.string :branch
      t.string :account_type
      t.string :number
      t.string :name

      t.timestamps
    end
  end
end
