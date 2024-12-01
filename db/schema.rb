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

ActiveRecord::Schema[7.0].define(version: 2024_11_29_095726) do
  create_table "buy_items", charset: "utf8", force: :cascade do |t|
    t.integer "quantity", null: false
    t.integer "item_price", null: false
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
    t.integer "total_price", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_buys_on_supplier_id"
  end

  create_table "categories", charset: "utf8", force: :cascade do |t|
    t.string "category", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "items", charset: "utf8", force: :cascade do |t|
    t.string "item_name", null: false
    t.string "unit", null: false
    t.integer "price", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "suppliers", charset: "utf8", force: :cascade do |t|
    t.string "company", null: false
    t.string "city"
    t.string "address"
    t.integer "phone"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "company", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.integer "phone", null: false
    t.string "manager", null: false
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
  add_foreign_key "categories", "users"
  add_foreign_key "items", "categories"
end
