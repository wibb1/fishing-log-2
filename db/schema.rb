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

ActiveRecord::Schema.define(version: 2021_05_31_224837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "records", force: :cascade do |t|
    t.string "name", null: false
    t.string "old_success"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.decimal "latitude", null: false
    t.decimal "longitude", null: false
    t.text "date", null: false
    t.text "time", null: false
    t.time "datetime", null: false
    t.float "js_date", null: false
    t.text "airTemperature", default: "NA"
    t.text "pressure", default: "NA"
    t.text "cloudCover", default: "NA"
    t.text "gust", default: "NA"
    t.text "humidity", default: "NA"
    t.text "visibility", default: "NA"
    t.text "windDirection", default: "NA"
    t.text "windSpeed", default: "NA"
    t.text "currentDirection", default: "NA"
    t.text "currentSpeed", default: "NA"
    t.text "first_type", default: "NA"
    t.text "first_time", default: "NA"
    t.text "first_height", default: "NA"
    t.text "second_type", default: "NA"
    t.text "second_time", default: "NA"
    t.text "second_height", default: "NA"
    t.text "third_type", default: "NA"
    t.text "third_time", default: "NA"
    t.text "third_height", default: "NA"
    t.text "fourth_type", default: "NA"
    t.text "fourth_time", default: "NA"
    t.text "fourth_height", default: "NA"
    t.text "astronomicalDawn", default: "NA"
    t.text "astronomicalDusk", default: "NA"
    t.text "civilDawn", default: "NA"
    t.text "civilDusk", default: "NA"
    t.text "moonFraction", default: "NA"
    t.text "moonPhase", default: "NA"
    t.text "moonrise", default: "NA"
    t.text "moonset", default: "NA"
    t.text "sunrise", default: "NA"
    t.text "sunset", default: "NA"
    t.text "astro_time", default: "NA"
    t.text "seaLevel", default: "NA"
    t.text "swellDirection", default: "NA"
    t.text "swellHeight", default: "NA"
    t.text "swellPeriod", default: "NA"
    t.text "secondarySwellDirection", default: "NA"
    t.text "secondarySwellHeight", default: "NA"
    t.text "secondarySwellPeriod", default: "NA"
    t.text "waveDirection", default: "NA"
    t.text "waveHeight", default: "NA"
    t.text "wavePeriod", default: "NA"
    t.text "windWaveDirection", default: "NA"
    t.text "windWaveHeight", default: "NA"
    t.text "windWavePeriod", default: "NA"
    t.integer "success", default: 0, null: false
    t.bigint "species_id"
    t.index ["species_id"], name: "index_records_on_species_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "common_name", null: false
    t.string "scientific_name", null: false
    t.string "shallow_depth", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "deep_depth", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "user_name", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
