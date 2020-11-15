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

ActiveRecord::Schema.define(version: 2020_11_08_050109) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "anglers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "surname", null: false
    t.string "name", null: false
    t.string "surname_phonetic", null: false
    t.string "name_phonetic", null: false
    t.string "postal_code", null: false
    t.string "street_address", null: false
    t.string "phone_number", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_anglers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_anglers_on_reset_password_token", unique: true
  end

  create_table "delivery_destinations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "postal_code", null: false
    t.string "street_address", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_delivery_destinations_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordered_products", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "purchase_price", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_ordered_products_on_order_id"
    t.index ["product_id"], name: "index_ordered_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "postal_code", null: false
    t.string "street_address", null: false
    t.string "name", null: false
    t.integer "postage", default: 800, null: false
    t.integer "request_amount", null: false
    t.integer "method_payment", null: false
    t.integer "order_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_in_carts", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_in_carts_on_product_id"
    t.index ["user_id"], name: "index_product_in_carts_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "angler_id", null: false
    t.string "name", null: false
    t.string "image_id", null: false
    t.text "explanation", null: false
    t.integer "price_excluding_tax", null: false
    t.integer "stock_quantity", null: false
    t.boolean "is_active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["angler_id"], name: "index_products_on_angler_id"
    t.index ["genre_id"], name: "index_products_on_genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "surname", null: false
    t.string "name", null: false
    t.string "surname_phonetic", null: false
    t.string "name_phonetic", null: false
    t.string "postal_code", null: false
    t.string "street_address", null: false
    t.string "phone_number", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
