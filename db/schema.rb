# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_03_195337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "country_masters", force: :cascade do |t|
    t.string "continent_code"
    t.string "assigned_code"
    t.string "name"
    t.boolean "active_status"
    t.boolean "del_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "district_masters", force: :cascade do |t|
    t.string "district_id"
    t.string "region_id"
    t.string "district_type"
    t.string "name"
    t.string "capital"
    t.string "capital_gps"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
  end

  create_table "district_type_masters", force: :cascade do |t|
    t.string "assigned_code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "region_masters", force: :cascade do |t|
    t.string "region_id"
    t.string "region_code"
    t.string "name"
    t.string "capital"
    t.string "capital_gps"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
    t.string "country_code"
  end

  create_table "regions", force: :cascade do |t|
    t.string "assigned_code"
    t.string "name"
    t.string "gps_location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "town_masters", force: :cascade do |t|
    t.string "town_id"
    t.string "district_id"
    t.string "name"
    t.string "town_center_gps"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
