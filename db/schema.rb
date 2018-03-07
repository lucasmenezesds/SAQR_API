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

ActiveRecord::Schema.define(version: 20180301002255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v1_cities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_deliveries", force: :cascade do |t|
    t.bigint "api_v1_delivery_truck_id"
    t.bigint "api_v1_picking_time_id"
    t.bigint "api_v1_load_time_id"
    t.bigint "api_v1_transportation_time_id"
    t.bigint "api_v1_receive_time_id"
    t.bigint "api_v1_storage_time_id"
    t.datetime "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_v1_delivery_truck_id"], name: "index_api_v1_deliveries_on_api_v1_delivery_truck_id"
    t.index ["api_v1_load_time_id"], name: "index_api_v1_deliveries_on_api_v1_load_time_id"
    t.index ["api_v1_picking_time_id"], name: "index_api_v1_deliveries_on_api_v1_picking_time_id"
    t.index ["api_v1_receive_time_id"], name: "index_api_v1_deliveries_on_api_v1_receive_time_id"
    t.index ["api_v1_storage_time_id"], name: "index_api_v1_deliveries_on_api_v1_storage_time_id"
    t.index ["api_v1_transportation_time_id"], name: "index_api_v1_deliveries_on_api_v1_transportation_time_id"
  end

  create_table "api_v1_delivery_trucks", force: :cascade do |t|
    t.bigint "api_v1_truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "delivery_id"
    t.index ["api_v1_truck_id"], name: "index_api_v1_delivery_trucks_on_api_v1_truck_id"
    t.index ["delivery_id"], name: "index_api_v1_delivery_trucks_on_delivery_id"
  end

  create_table "api_v1_drivers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_load_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "load_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_picking_times", force: :cascade do |t|
    t.integer "duration_time"
    t.time "start_time"
    t.integer "number_of_items"
    t.integer "number_of_items_type"
    t.datetime "picking_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_receive_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "received_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_storage_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "storage_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_transportation_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "transportation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "destination_city_id"
    t.bigint "origin_city_id"
    t.index ["destination_city_id"], name: "index_api_v1_transportation_times_on_destination_city_id"
    t.index ["origin_city_id"], name: "index_api_v1_transportation_times_on_origin_city_id"
  end

  create_table "api_v1_trucks", force: :cascade do |t|
    t.bigint "api_v1_driver_id"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_v1_driver_id"], name: "index_api_v1_trucks_on_api_v1_driver_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "api_v1_deliveries", "api_v1_delivery_trucks"
  add_foreign_key "api_v1_deliveries", "api_v1_load_times"
  add_foreign_key "api_v1_deliveries", "api_v1_picking_times"
  add_foreign_key "api_v1_deliveries", "api_v1_receive_times"
  add_foreign_key "api_v1_deliveries", "api_v1_storage_times"
  add_foreign_key "api_v1_deliveries", "api_v1_transportation_times"
  add_foreign_key "api_v1_delivery_trucks", "api_v1_deliveries", column: "delivery_id"
  add_foreign_key "api_v1_delivery_trucks", "api_v1_trucks"
  add_foreign_key "api_v1_transportation_times", "api_v1_cities", column: "destination_city_id"
  add_foreign_key "api_v1_transportation_times", "api_v1_cities", column: "origin_city_id"
  add_foreign_key "api_v1_trucks", "api_v1_drivers"
end
