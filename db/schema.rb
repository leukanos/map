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

ActiveRecord::Schema.define(version: 20150603204214) do

  create_table "dictionaries", force: :cascade do |t|
    t.integer  "kind",       limit: 4
    t.string   "symbol",     limit: 255
    t.string   "ancestry",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "dictionaries", ["ancestry"], name: "index_dictionaries_on_ancestry", using: :btree
  add_index "dictionaries", ["kind"], name: "index_dictionaries_on_kind", using: :btree

  create_table "kinds", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "short_name",     limit: 25
    t.string   "state",          limit: 255
    t.date     "closing_date"
    t.string   "ancestry",       limit: 255
    t.integer  "assigned_to_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "description",    limit: 65535
  end

  create_table "projects_users", force: :cascade do |t|
    t.integer "user_id",    limit: 4
    t.integer "project_id", limit: 4
  end

  add_index "projects_users", ["project_id", "user_id"], name: "index_projects_users_on_project_id_and_user_id", using: :btree
  add_index "projects_users", ["user_id", "project_id"], name: "index_projects_users_on_user_id_and_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.string   "email",                  limit: 255,                         default: "", null: false
    t.string   "encrypted_password",     limit: 255,                         default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,                           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "tel",                    limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "roles_mask",             limit: 4
    t.decimal  "limit",                              precision: 8, scale: 2
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_times", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "project_id", limit: 4
    t.string   "form",       limit: 255
    t.string   "action",     limit: 255
    t.date     "date"
    t.decimal  "time",                   precision: 10
    t.string   "comment",    limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "kind_id",    limit: 4
  end

  add_index "work_times", ["kind_id"], name: "index_work_times_on_kind_id", using: :btree

end
