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

ActiveRecord::Schema.define(version: 20170330151856) do

  create_table "art_tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "opening_at"
    t.datetime "closing_at"
    t.integer  "artists_max"
    t.float    "area_left"
    t.float    "area_max"
    t.float    "price_per_day_per_area"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "place_id"
    t.index ["place_id"], name: "index_exhibitions_on_place_id"
  end

  create_table "exhibitions_parts", force: :cascade do |t|
    t.integer "exhibition_id", null: false
    t.integer "art_tag_id",    null: false
    t.index ["art_tag_id"], name: "index_exhibitions_parts_on_art_tag_id"
    t.index ["exhibition_id"], name: "index_exhibitions_parts_on_exhibition_id"
  end

  create_table "image_places", force: :cascade do |t|
    t.string   "alt"
    t.string   "file"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "place_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["place_id"], name: "index_image_places_on_place_id"
  end

  create_table "image_users", force: :cascade do |t|
    t.string   "alt"
    t.string   "file"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["user_id"], name: "index_image_users_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "area",          null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "exhibition_id"
    t.index ["exhibition_id"], name: "index_participations_on_exhibition_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "address",     null: false
    t.integer  "zipcode",     null: false
    t.string   "city",        null: false
    t.float    "area_max",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "lastname",               default: "",        null: false
    t.string   "firstname",              default: "",        null: false
    t.string   "address"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "tel"
    t.string   "status",                 default: "visitor", null: false
    t.string   "main_status",            default: "visitor", null: false
    t.boolean  "admin",                  default: false,     null: false
    t.boolean  "banned",                 default: false,     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_tag_parts", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "art_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_tag_id"], name: "index_users_tag_parts_on_art_tag_id"
    t.index ["user_id"], name: "index_users_tag_parts_on_user_id"
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "coming_at",     null: false
    t.datetime "duration",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "exhibition_id"
    t.integer  "user_id"
    t.index ["exhibition_id"], name: "index_visits_on_exhibition_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

end
