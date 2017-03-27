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

ActiveRecord::Schema.define(version: 20170327113744) do

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
  end

end
