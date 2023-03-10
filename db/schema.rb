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

ActiveRecord::Schema[7.0].define(version: 2023_01_05_014916) do
  create_table "brands", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "logo_url"
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "car_pictures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "url", null: false
    t.bigint "car_id", null: false
    t.index ["car_id"], name: "index_car_pictures_on_car_id"
  end

  create_table "cars", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "plate_number"
    t.string "description"
    t.string "availability", default: "available", null: false
    t.string "fuel_type"
    t.string "gear_type"
    t.string "model"
    t.bigint "brand_id", null: false
    t.bigint "color_id", null: false
    t.bigint "location_id", null: false
    t.integer "kilometer", default: 0, null: false
    t.integer "model_year", null: false
    t.float "price_per_day", null: false
    t.float "price_per_month", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_cars_on_brand_id"
    t.index ["color_id"], name: "index_cars_on_color_id"
    t.index ["location_id"], name: "index_cars_on_location_id"
    t.index ["plate_number"], name: "index_cars_on_plate_number", unique: true
  end

  create_table "colors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "hex", null: false
    t.index ["hex"], name: "index_colors_on_hex", unique: true
    t.index ["name"], name: "index_colors_on_name", unique: true
  end

  create_table "locations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "address"
    t.string "city"
  end

  create_table "rentals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_rentals_on_car_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.date "birthdate"
    t.string "email"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "car_pictures", "cars"
  add_foreign_key "cars", "brands"
  add_foreign_key "cars", "colors"
  add_foreign_key "cars", "locations"
  add_foreign_key "rentals", "cars"
  add_foreign_key "rentals", "users"
end
