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

ActiveRecord::Schema.define(version: 20150514085822) do

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "provider",   limit: 255, null: false
    t.string   "uid",        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree

  create_table "operation_authentications", force: :cascade do |t|
    t.integer  "user_id",      limit: 4,                   null: false
    t.integer  "scope",        limit: 4
    t.string   "service_name", limit: 255
    t.string   "key",          limit: 255
    t.string   "value",        limit: 255
    t.boolean  "masked",       limit: 1,   default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "operation_authentications", ["service_name", "key"], name: "index_operation_authentications_on_service_name_and_key", using: :btree

  create_table "operations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "enable",     limit: 1,     default: false, null: false
    t.string   "target_url", limit: 255
    t.text     "script",     limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "programing_languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "programs", force: :cascade do |t|
    t.text     "code",                   limit: 65535
    t.integer  "programing_language_id", limit: 4,     null: false
    t.integer  "operation_id",           limit: 4,     null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "programs", ["operation_id"], name: "index_programs_on_operation_id", using: :btree

  create_table "scenario_operations", force: :cascade do |t|
    t.integer "scenario_id",  limit: 4,             null: false
    t.integer "operation_id", limit: 4,             null: false
    t.integer "position",     limit: 4, default: 0, null: false
  end

  add_index "scenario_operations", ["operation_id", "scenario_id"], name: "index_scenario_operations_on_operation_id_and_scenario_id", using: :btree
  add_index "scenario_operations", ["operation_id"], name: "index_scenario_operations_on_operation_id", using: :btree
  add_index "scenario_operations", ["scenario_id", "operation_id"], name: "index_scenario_operations_on_scenario_id_and_operation_id", using: :btree
  add_index "scenario_operations", ["scenario_id"], name: "index_scenario_operations_on_scenario_id", using: :btree

  create_table "scenarios", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                        limit: 255, null: false
    t.string   "name",                         limit: 255
    t.string   "crypted_password",             limit: 255
    t.string   "salt",                         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token",            limit: 255
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
