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

ActiveRecord::Schema.define(version: 2018_11_27_023022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checklists", force: :cascade do |t|
    t.string "description"
    t.integer "event_id"
    t.string "entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_checklists_on_event_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start"
    t.string "frequency"
    t.string "location"
    t.integer "event_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end"
    t.bigint "user_id"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specific_1"
    t.string "specific_2"
    t.string "specific_3"
    t.string "specific_4"
    t.string "measurable_1"
    t.string "measurable_2"
    t.string "measurable_3"
    t.string "measurable_4"
    t.string "attainable_1"
    t.string "attainable_2"
    t.string "attainable_3"
    t.string "attainable_4"
    t.string "rewarding_1"
    t.string "rewarding_2"
    t.string "rewarding_3"
    t.string "rewarding_4"
    t.string "timely_1"
    t.string "timely_2"
    t.bigint "user_id"
    t.boolean "complete", default: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "health_conditions", force: :cascade do |t|
    t.string "condition_name"
    t.float "normal_range_upper"
    t.float "normal_range_lower"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "assistance_threshold"
    t.bigint "user_id"
    t.string "unit_of_measure"
    t.index ["user_id"], name: "index_health_conditions_on_user_id"
  end

  create_table "internal_contents", force: :cascade do |t|
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_internal_contents_on_resource_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.string "rx_photograph_link"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "strength"
    t.string "description"
    t.string "instruction"
    t.string "condition_cure"
  end

  create_table "resources", force: :cascade do |t|
    t.string "description"
    t.string "url"
    t.float "quality_score"
    t.string "content_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracked_health_conditions", force: :cascade do |t|
    t.float "severity_score"
    t.datetime "last_checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "health_condition_id"
    t.bigint "value_type_id"
    t.index ["health_condition_id"], name: "index_tracked_health_conditions_on_health_condition_id"
    t.index ["value_type_id"], name: "index_tracked_health_conditions_on_value_type_id"
  end

  create_table "tracked_medications", force: :cascade do |t|
    t.string "prescribed_by"
    t.string "special_instruction"
    t.string "dosage"
    t.string "frequency"
    t.integer "user_id"
    t.integer "medication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_id"], name: "index_tracked_medications_on_medication_id"
    t.index ["user_id"], name: "index_tracked_medications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.boolean "admin", default: false
    t.date "date_of_birth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "value_types", force: :cascade do |t|
    t.string "name", default: "Amount"
    t.bigint "health_condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_condition_id"], name: "index_value_types_on_health_condition_id"
  end

  add_foreign_key "events", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "tracked_health_conditions", "value_types"
  add_foreign_key "value_types", "health_conditions"
end
