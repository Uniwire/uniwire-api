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

ActiveRecord::Schema.define(version: 2020_06_23_133839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characteristics", force: :cascade do |t|
    t.bigint "vancancy_id"
    t.boolean "air_conditioning"
    t.boolean "exclusive_bathroom"
    t.integer "parking_spot"
    t.boolean "water_bill"
    t.boolean "electricity_bill"
    t.boolean "gas_bill"
    t.integer "furnished"
    t.string "furnished_description"
    t.boolean "include_cleaner"
    t.string "include_cleaner_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vancancy_id"], name: "index_characteristics_on_vancancy_id"
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

  create_table "image_examples", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_residences", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "property_type"
    t.integer "accomodation_type"
    t.boolean "pet_friendly"
    t.boolean "lgbt_friendly"
    t.boolean "accept_smoker"
    t.boolean "accept_alcoohol"
    t.integer "residents_gender"
    t.integer "internet"
    t.integer "furniture"
    t.integer "capacity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.bigint "student_residence_id"
    t.integer "gender"
    t.string "description"
    t.decimal "monthly_cost"
    t.integer "availability"
    t.string "availability_description"
    t.integer "type"
    t.decimal "square_meter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_residence_id"], name: "index_vacancies_on_student_residence_id"
  end

  add_foreign_key "commodities_vacancies", "commodities"
  add_foreign_key "commodities_vacancies", "vacancies"
end
