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

ActiveRecord::Schema.define(version: 20190407205231) do

  create_table "beekeepers", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.integer  "experience"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.string  "content"
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "hive_id"
    t.float    "temperature"
    t.string   "conditions"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hives", force: :cascade do |t|
    t.integer  "beekeeper_id"
    t.string   "name"
    t.string   "hive_type"
    t.string   "bee_type"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "beekeeper_id"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
