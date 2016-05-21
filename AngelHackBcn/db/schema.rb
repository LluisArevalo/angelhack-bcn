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

ActiveRecord::Schema.define(version: 20160521143115) do

  create_table "action_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "action_id"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "action_comments", ["action_id"], name: "index_action_comments_on_action_id"
  add_index "action_comments", ["user_id"], name: "index_action_comments_on_user_id"

  create_table "action_statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "action_id"
    t.boolean  "solved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "action_statuses", ["action_id"], name: "index_action_statuses_on_action_id"
  add_index "action_statuses", ["user_id"], name: "index_action_statuses_on_user_id"

  create_table "actions", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "priorities", force: :cascade do |t|
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "priority_assignations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "priority_id"
    t.integer  "action_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "priority_assignations", ["action_id"], name: "index_priority_assignations_on_action_id"
  add_index "priority_assignations", ["priority_id"], name: "index_priority_assignations_on_priority_id"
  add_index "priority_assignations", ["user_id"], name: "index_priority_assignations_on_user_id"

  create_table "regions", force: :cascade do |t|
    t.string   "ambit"
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
end
