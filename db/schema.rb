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

ActiveRecord::Schema.define(version: 20161107151207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "cities", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.decimal  "center_longitude"
    t.decimal  "center_latitude"
    t.decimal  "city_delimiter"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "points", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "vehicle_id"
    t.uuid     "city_id"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "timestamp"
    t.integer  "current_heading"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["city_id"], name: "index_points_on_city_id", using: :btree
    t.index ["vehicle_id"], name: "index_points_on_vehicle_id", using: :btree
  end

  create_table "vehicles", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "vehicle_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
