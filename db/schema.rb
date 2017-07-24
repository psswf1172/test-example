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

ActiveRecord::Schema.define(version: 20170724155517) do

  create_table "add_ons", force: :cascade do |t|
    t.string "name"
    t.string "brand"
  end

  create_table "ice_creams", force: :cascade do |t|
    t.string   "name"
    t.datetime "release_start"
    t.datetime "release_end"
    t.text     "categories"
    t.integer  "servings"
    t.integer  "course"
  end

  create_table "toppings", force: :cascade do |t|
    t.string   "name"
    t.datetime "release_month"
    t.integer  "category"
    t.integer  "add_on_id"
    t.boolean  "homemade"
    t.integer  "course"
  end

end
