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

ActiveRecord::Schema.define(version: 20170728172730) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cities", ["location_id"], name: "index_cities_on_location_id"

  create_table "forecasts", force: :cascade do |t|
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city"
    t.string   "weather"
    t.integer  "cities_id"
    t.integer  "list_id"
  end

  add_index "forecasts", ["cities_id"], name: "index_forecasts_on_cities_id"
  add_index "forecasts", ["list_id"], name: "index_forecasts_on_list_id"

  create_table "lists", force: :cascade do |t|
    t.string   "dt"
    t.decimal  "pressure"
    t.decimal  "humidity"
    t.decimal  "speed"
    t.integer  "deg"
    t.integer  "clouds"
    t.decimal  "rain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "temp_id"
    t.integer  "weather_id"
  end

  add_index "lists", ["temp_id"], name: "index_lists_on_temp_id"
  add_index "lists", ["weather_id"], name: "index_lists_on_weather_id"

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temps", force: :cascade do |t|
    t.decimal  "day"
    t.decimal  "min"
    t.decimal  "max"
    t.decimal  "night"
    t.decimal  "eve"
    t.decimal  "morn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "dt"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "userid"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.string   "main"
    t.string   "description"
    t.string   "icon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "dt"
  end

end
