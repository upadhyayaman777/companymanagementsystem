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

ActiveRecord::Schema[7.1].define(version: 2023_12_29_062127) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact"
    t.string "email"
    t.string "industry_type"
    t.string "regestration_number"
    t.date "founding_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", primary_key: "department_code", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.string "address"
    t.date "joining"
    t.decimal "salary"
    t.bigint "company_id", null: false
    t.string "department_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "manager_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["department_code"], name: "index_employees_on_department_code"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["manager_id"], name: "index_employees_on_manager_id"
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "leafs", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.text "reason"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_leafs_on_employee_id"
  end

  add_foreign_key "departments", "companies"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "departments", column: "department_code", primary_key: "department_code", on_delete: :cascade
  add_foreign_key "employees", "employees", column: "manager_id"
  add_foreign_key "leafs", "employees"
end
