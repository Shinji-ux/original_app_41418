# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_12_03_042655) do
  create_table "buy_items", charset: "utf8", force: :cascade do |t|
    t.integer "quantity", null: false
    t.integer "item_price"
    t.integer "item_total_price"
    t.bigint "buy_id", null: false
    t.bigint "item_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buy_id"], name: "index_buy_items_on_buy_id"
    t.index ["category_id"], name: "index_buy_items_on_category_id"
    t.index ["item_id"], name: "index_buy_items_on_item_id"
  end

  create_table "buys", charset: "utf8", force: :cascade do |t|
    t.date "transaction_date", null: false
    t.integer "total_price"
    t.bigint "user_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_buys_on_supplier_id"
    t.index ["user_id"], name: "index_buys_on_user_id"
  end

  create_table "categories", charset: "utf8", force: :cascade do |t|
    t.string "category", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "customers", charset: "utf8", force: :cascade do |t|
    t.string "company", null: false
    t.string "city"
    t.string "address"
    t.string "phone"
    t.bigint "user_id"
    t.string "bank"
    t.string "branch"
    t.string "account_type"
    t.string "number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "items", charset: "utf8", force: :cascade do |t|
    t.string "item_name", null: false
    t.string "unit", null: false
    t.integer "price", null: false
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "sell_items", charset: "utf8", force: :cascade do |t|
    t.integer "quantity", null: false
    t.integer "item_price", null: false
    t.integer "item_total_price", null: false
    t.bigint "sell_id", null: false
    t.bigint "item_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sell_items_on_category_id"
    t.index ["item_id"], name: "index_sell_items_on_item_id"
    t.index ["sell_id"], name: "index_sell_items_on_sell_id"
  end

  create_table "sells", charset: "utf8", force: :cascade do |t|
    t.date "transaction_date", null: false
    t.integer "total_price", null: false
    t.bigint "user_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_sells_on_customer_id"
    t.index ["user_id"], name: "index_sells_on_user_id"
  end

  create_table "suppliers", charset: "utf8", force: :cascade do |t|
    t.string "company", null: false
    t.string "city"
    t.string "address"
    t.string "phone"
    t.bigint "user_id"
    t.string "bank"
    t.string "branch"
    t.string "account_type"
    t.string "number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "company", null: false
    t.string "city"
    t.string "address"
    t.string "phone"
    t.string "manager"
    t.string "invoice"
    t.string "bank"
    t.string "branch"
    t.string "account_type"
    t.string "number"
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buy_items", "buys"
  add_foreign_key "buy_items", "categories"
  add_foreign_key "buy_items", "items"
  add_foreign_key "buys", "suppliers"
  add_foreign_key "buys", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "sell_items", "categories"
  add_foreign_key "sell_items", "items"
  add_foreign_key "sell_items", "sells"
  add_foreign_key "sells", "customers"
  add_foreign_key "sells", "users"
end
