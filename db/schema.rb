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

ActiveRecord::Schema.define(version: 20151012044325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cast_and_crew_members", force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "people_with_role_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "cast_and_crew_members", ["people_with_role_id"], name: "index_cast_and_crew_members_on_people_with_role_id", using: :btree
  add_index "cast_and_crew_members", ["video_id"], name: "index_cast_and_crew_members_on_video_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_with_roles", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people_with_roles", ["person_id"], name: "index_people_with_roles_on_person_id", using: :btree
  add_index "people_with_roles", ["role_id"], name: "index_people_with_roles_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "role",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "desc",       null: false
    t.string   "directors"
    t.string   "actors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cast_and_crew_members", "people_with_roles"
  add_foreign_key "cast_and_crew_members", "videos"
  add_foreign_key "people_with_roles", "people"
  add_foreign_key "people_with_roles", "roles"
end
