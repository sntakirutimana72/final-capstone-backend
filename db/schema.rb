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

ActiveRecord::Schema[7.0].define(version: 2022_10_21_113723) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "number_of_beds", null: false
    t.decimal "price", null: false
    t.text "description"
    t.bigint "room_type_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "rooms_accomodations", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "accomodation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomodation_id"], name: "index_rooms_accomodations_on_accomodation_id"
    t.index ["room_id"], name: "index_rooms_accomodations_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "password_digest"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "users"
  add_foreign_key "rooms", "room_types"
  add_foreign_key "rooms", "users"
  add_foreign_key "rooms_accomodations", "accomodations"
  add_foreign_key "rooms_accomodations", "rooms"
end
