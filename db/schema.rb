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

ActiveRecord::Schema.define(version: 2020_07_10_174831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characteristics", force: :cascade do |t|
    t.bigint "vacancy_id", null: false
    t.boolean "air_conditioning", default: false
    t.boolean "exclusive_bathroom", default: true
    t.integer "parking_spot", default: 0
    t.boolean "water_bill", default: true
    t.boolean "electricity_bill", default: true
    t.boolean "gas_bill", default: true
    t.integer "furnished", default: 0
    t.string "furnished_description"
    t.boolean "include_cleaner", default: false
    t.string "include_cleaner_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vacancy_id"], name: "index_characteristics_on_vacancy_id"
  end

  create_table "commodities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "commodities_vacancies", force: :cascade do |t|
    t.bigint "vacancy_id", null: false
    t.bigint "commodity_id", null: false
    t.index ["commodity_id"], name: "index_commodities_vacancies_on_commodity_id"
    t.index ["vacancy_id"], name: "index_commodities_vacancies_on_vacancy_id"
  end

  create_table "risk_areas", force: :cascade do |t|
    t.integer "type"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_residences", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "property_type", default: 0
    t.integer "accomodation_type", default: 0
    t.boolean "pet_friendly", default: true
    t.boolean "lgbt_friendly", default: true
    t.boolean "accept_smoker", default: false
    t.boolean "accept_alcoohol", default: true
    t.integer "residents_gender", default: 0
    t.integer "internet", default: 0
    t.integer "furniture", default: 0
    t.integer "capacity", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.bigint "student_residence_id"
    t.integer "gender", default: 0
    t.string "description"
    t.decimal "monthly_cost", default: "0.0"
    t.integer "availability", default: 0
    t.string "availability_description"
    t.integer "type", default: 0
    t.decimal "square_meter", default: "0.0"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_residence_id"], name: "index_vacancies_on_student_residence_id"
  end

  add_foreign_key "characteristics", "vacancies"
  add_foreign_key "commodities_vacancies", "commodities"
  add_foreign_key "commodities_vacancies", "vacancies"
end
