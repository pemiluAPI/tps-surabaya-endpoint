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

ActiveRecord::Schema.define(version: 20151208032856) do

  create_table "alamat_lists", force: true do |t|
    t.string   "alamat"
    t.integer  "kelurahan_id"
    t.string   "no_tps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alamat_lists", ["kelurahan_id"], name: "index_alamat_lists_on_kelurahan_id", using: :btree

  create_table "districts", force: true do |t|
    t.string "name"
  end

  create_table "kecamatan_lists", force: true do |t|
    t.string   "kecamatan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kelurahan_lists", force: true do |t|
    t.integer  "kecamatan_id"
    t.string   "kelurahan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kelurahan_lists", ["kecamatan_id"], name: "index_kelurahan_lists_on_kecamatan_id", using: :btree

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tps", force: true do |t|
    t.integer "district_id"
    t.integer "village_id"
    t.text    "address"
    t.string  "no"
  end

  add_index "tps", ["district_id"], name: "index_tps_on_district_id", using: :btree
  add_index "tps", ["village_id"], name: "index_tps_on_village_id", using: :btree

end
