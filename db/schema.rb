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

ActiveRecord::Schema.define(version: 20150825043640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "street_address"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "state",            limit: 2
    t.string   "postal_code",      limit: 12
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree
  add_index "companies", ["street_address", "street_address_2", "city", "state", "postal_code"], name: "by_address", unique: true, using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "salutation"
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.string   "title"
    t.integer  "company_id"
    t.string   "main_phone"
    t.string   "second_phone"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id", using: :btree
  add_index "contacts", ["email"], name: "index_contacts_on_email", using: :btree
  add_index "contacts", ["first_name", "last_name"], name: "by_full_name", unique: true, using: :btree
  add_index "contacts", ["main_phone"], name: "index_contacts_on_main_phone", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "last_touch"
    t.datetime "application_sent"
    t.string   "position_name"
    t.integer  "company_id"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree

  add_foreign_key "jobs", "companies"
end
