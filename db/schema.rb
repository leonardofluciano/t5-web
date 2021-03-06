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

ActiveRecord::Schema.define(version: 2021_03_03_231042) do

  create_table "companies", force: :cascade do |t|
    t.string "name", limit: 191
    t.string "legal_name", limit: 191
    t.string "document", limit: 13
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", limit: 191
    t.string "surname", limit: 191
    t.string "document", limit: 11
    t.string "email", limit: 191
    t.string "phone", limit: 14
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers_subsidiaries", id: false, force: :cascade do |t|
    t.integer "subsidiary_id", null: false
    t.integer "customer_id", null: false
    t.index ["subsidiary_id", "customer_id"], name: "index_customers_subsidiaries_on_subsidiary_id_and_customer_id"
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name", limit: 191
    t.string "legal_name", limit: 191
    t.string "document", limit: 13
    t.integer "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_subsidiaries_on_company_id"
  end

  add_foreign_key "subsidiaries", "companies"
end
