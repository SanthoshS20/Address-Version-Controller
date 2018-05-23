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

ActiveRecord::Schema.define(version: 2018_05_14_164801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  
  #my table name "addresses" and primary key "address_id"
  create_table "addresses", primary_key: "address_id", id: :serial, force: :cascade do |t|
    #The below variable has been used for my addresses table
    t.text "address"
    t.string "company"
    t.integer "current_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  #my table name "versions"
  create_table "versions", id: :serial, force: :cascade do |t|
    #The below variable has been used for my versions table
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_id"
    t.string "ver_address"
  end

  #foreign key has been used "address_id in versions" references primary key in the addresses table
  add_foreign_key "versions", "addresses", primary_key: "address_id", name: "versions_address_id_fkey"
end
