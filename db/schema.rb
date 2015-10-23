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

ActiveRecord::Schema.define(version: 20151023133701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "cd"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "description"
    t.string   "cd"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "packege_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "packeges", force: :cascade do |t|
    t.integer  "travel_id"
    t.integer  "sender_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "senders", force: :cascade do |t|
    t.integer  "city_id_destination"
    t.integer  "city_id_departure"
    t.time     "arrive_time"
    t.string   "img"
    t.string   "object_description"
    t.integer  "user_id"
    t.integer  "packege_type_id"
    t.string   "note"
    t.boolean  "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "travels", force: :cascade do |t|
    t.integer  "city_id_destination"
    t.integer  "city_id_departure"
    t.time     "arrive_time"
    t.time     "departure_time"
    t.string   "img_ticke"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "age"
    t.string   "rol"
    t.string   "name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "occupation"
    t.string   "pic"
    t.string   "bio"
    t.string   "city"
    t.string   "tw"
    t.string   "int"
    t.string   "fb"
    t.string   "provider",               default: "email"
    t.string   "uid",                    default: "",      null: false
    t.string   "unconfirmed_email"
    t.string   "nickname"
    t.string   "image"
    t.text     "tokens"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "confirm_success_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
