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

ActiveRecord::Schema.define(version: 20161206184510) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "adress"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "family"
    t.string   "name"
    t.string   "adress"
    t.string   "phone"
    t.text     "description"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name"
    t.string   "adress"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordereds", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "preparat_id"
    t.integer  "quantity"
    t.float    "discount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "datepublic"
    t.date     "dateperformance"
    t.float    "costdelivery"
    t.integer  "client_id"
    t.integer  "delivery_id"
    t.integer  "employee_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preparats", force: :cascade do |t|
    t.string   "name"
    t.float    "cost"
    t.date     "dateofmanufacturer"
    t.integer  "shelflife"
    t.text     "description"
    t.integer  "manufacturer_id"
    t.integer  "type_id"
    t.integer  "provider_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "adress"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "typeform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
