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

ActiveRecord::Schema.define(version: 2021_02_20_122556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "constituencies", force: :cascade do |t|
    t.string "constituency_id"
    t.string "district_id"
    t.string "name"
    t.string "ec_constituency_code"
    t.integer "registered_voters"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.string "region_id"
  end

  create_table "constituency_duplicates", force: :cascade do |t|
    t.string "constituency_id"
    t.string "district_id"
    t.string "name"
    t.string "ec_constituency_code"
    t.integer "registered_voters"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "region_id"
  end

  create_table "country_masters", force: :cascade do |t|
    t.string "continent_code"
    t.string "assigned_code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
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

  create_table "election_event_locations", force: :cascade do |t|
    t.string "assigned_code"
    t.string "election_event_id"
    t.string "region_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "polling_station_id"
    t.string "constituency_id"
  end

  create_table "election_event_masters", force: :cascade do |t|
    t.string "election_event_id"
    t.string "event_name"
    t.string "election_type"
    t.datetime "election_date"
    t.text "notes"
    t.string "ec_election_reference"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
  end

  create_table "political_party_masters", force: :cascade do |t|
    t.string "political_party_id"
    t.string "region_id"
    t.string "name"
    t.string "party_initial"
    t.string "contact_number"
    t.string "email_address"
    t.string "party_logo"
    t.string "image_path"
    t.string "hq_address_line_1"
    t.string "hq_address_line_2"
    t.string "district_id"
    t.string "town_id"
    t.string "gps_coordinates"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.string "nearest_landmark"
  end

  create_table "polling_station_agents", force: :cascade do |t|
    t.string "agent_id"
    t.string "political_party_id"
    t.string "region_id"
    t.string "constituency_id"
    t.string "polling_station_id"
    t.string "title"
    t.string "firstname"
    t.string "lastname"
    t.string "gender_id"
    t.string "agent_photo"
    t.string "image_path"
    t.string "agent_signature_image"
    t.string "phone_number"
    t.string "email_address"
    t.string "hq_address_line_1"
    t.string "hq_address_line_2"
    t.string "city"
    t.string "town_id"
    t.string "gps_coordinates"
    t.string "nearest_landmark"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
  end

  create_table "polling_station_masters", force: :cascade do |t|
    t.string "polling_station_id"
    t.string "region_id"
    t.string "constituency_id"
    t.string "name"
    t.string "ec_polling_station_code"
    t.string "polling_station_gps"
    t.boolean "constituency_collation_center"
    t.integer "registered_voters"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
