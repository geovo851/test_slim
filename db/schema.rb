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

ActiveRecord::Schema.define(version: 20151115221844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "best_sellers", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "best_sellers", ["product_id"], name: "index_best_sellers_on_product_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "gender_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "brands", ["gender_id"], name: "index_brands_on_gender_id", using: :btree

  create_table "carousel_products", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "photo"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carousel_products", ["product_id"], name: "index_carousel_products_on_product_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["product_id"], name: "index_comments_on_product_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "genders", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "sender"
    t.string   "name"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "payment_id"
    t.text     "delivary_adress"
    t.boolean  "order",                                    default: false
    t.integer  "phone_number"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.decimal  "total_sum",       precision: 15, scale: 2, default: 0.0
  end

  add_index "orders", ["payment_id"], name: "index_orders_on_payment_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "type_of_paiment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "orig"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "large"
    t.string   "small"
  end

  add_index "photos", ["product_id"], name: "index_photos_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.text     "name"
    t.string   "photo"
    t.text     "description"
    t.integer  "category_id"
    t.float    "price"
    t.boolean  "available",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "brand_id"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "products_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.float    "quantity",   default: 0.0
    t.float    "price",      default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "color_id"
    t.integer  "size_id"
  end

  add_index "products_orders", ["color_id"], name: "index_products_orders_on_color_id", using: :btree
  add_index "products_orders", ["order_id"], name: "index_products_orders_on_order_id", using: :btree
  add_index "products_orders", ["product_id"], name: "index_products_orders_on_product_id", using: :btree
  add_index "products_orders", ["size_id"], name: "index_products_orders_on_size_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slider_products", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "photo"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "slider_products", ["product_id"], name: "index_slider_products_on_product_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "adress"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "best_sellers", "products"
  add_foreign_key "brands", "genders"
  add_foreign_key "carousel_products", "products"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "orders", "payments"
  add_foreign_key "photos", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products_orders", "colors"
  add_foreign_key "products_orders", "orders"
  add_foreign_key "products_orders", "products"
  add_foreign_key "products_orders", "sizes"
  add_foreign_key "slider_products", "products"
  add_foreign_key "users", "roles"
end
