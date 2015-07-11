# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150710054009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "brand"
    t.string   "name"
    t.string   "manufacturer"
    t.string   "category"
    t.integer  "category_id"
    t.text     "ingredients"
    t.text     "description"
    t.string   "tags"
    t.integer  "total_servings"
    t.string   "servings_unit"
    t.string   "weight"
    t.string   "upc"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "price"
  end

  create_table "retailer_item_prices", force: :cascade do |t|
    t.integer  "retailer_id"
    t.integer  "item_id"
    t.string  "price",                        null: false
    t.integer  "product_id"
    t.boolean  "on_sale",     default: false
    t.string   "sale_price"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "retailer_item_prices", ["item_id"], name: "index_retailer_item_prices_on_item_id", using: :btree
  add_index "retailer_item_prices", ["retailer_id"], name: "index_retailer_item_prices_on_retailer_id", using: :btree

  create_table "retailer_users", force: :cascade do |t|
    t.integer  "retailer_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "retailer_users", ["retailer_id"], name: "index_retailer_users_on_retailer_id", using: :btree
  add_index "retailer_users", ["user_id"], name: "index_retailer_users_on_user_id", using: :btree

  create_table "retailers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "retailer_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stores", ["retailer_id"], name: "index_stores_on_retailer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "client_id"
    t.string   "secret_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "retailer_item_prices", "items"
  add_foreign_key "retailer_item_prices", "retailers"
  add_foreign_key "retailer_users", "retailers"
  add_foreign_key "retailer_users", "users"
  add_foreign_key "stores", "retailers"
end
