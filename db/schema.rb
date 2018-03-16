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

ActiveRecord::Schema.define(version: 20180315154140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.boolean "included"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options_vehicle_models", id: false, force: :cascade do |t|
    t.bigint "option_id", null: false
    t.bigint "vehicle_model_id", null: false
    t.index ["option_id", "vehicle_model_id"], name: "index_options_vehicle_models_on_option_id_and_vehicle_model_id"
    t.index ["vehicle_model_id", "option_id"], name: "index_options_vehicle_models_on_vehicle_model_id_and_option_id"
  end

  create_table "vehicle_makes", primary_key: "vehicle_make_id", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", primary_key: "vehicle_model_id", force: :cascade do |t|
    t.bigint "vehicle_make_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_make_id"], name: "index_vehicle_models_on_vehicle_make_id"
  end

  create_table "vehicles", primary_key: "vehicle_id", force: :cascade do |t|
    t.bigint "vehicle_make_id"
    t.bigint "vehicle_model_id"
    t.string "vin"
    t.string "owner"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_make_id"], name: "index_vehicles_on_vehicle_make_id"
    t.index ["vehicle_model_id"], name: "index_vehicles_on_vehicle_model_id"
  end

end
