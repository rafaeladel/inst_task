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

ActiveRecord::Schema.define(version: 20160524150945) do

  create_table "bugs", force: :cascade do |t|
    t.text     "app_token",    limit: 65535
    t.integer  "bug_number",   limit: 4
    t.integer  "bug_status",   limit: 4
    t.integer  "bug_priority", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "bugs", ["app_token", "bug_number"], name: "index_bugs_on_app_token_and_bug_number", length: {"app_token"=>10, "bug_number"=>nil}, using: :btree

  create_table "states", force: :cascade do |t|
    t.integer  "bug_id",     limit: 4
    t.string   "device",     limit: 255
    t.string   "os",         limit: 255
    t.integer  "memory",     limit: 4
    t.integer  "storage",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "states", ["bug_id"], name: "fk_rails_da0b73b3a0", using: :btree

  add_foreign_key "states", "bugs", on_delete: :cascade
end
