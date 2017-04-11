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

ActiveRecord::Schema.define(version: 20160628084839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "uuid-ossp"

  create_table "identities", force: :cascade do |t|
    t.uuid     "user_id"
    t.string   "provider"
    t.string   "accesstoken"
    t.string   "refreshtoken"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
    t.string   "phone"
    t.string   "urls"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "readers", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "from_id",     null: false
    t.json     "preferences"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "readers", ["from_id"], name: "index_readers_on_from_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.uuid     "friend_one", null: false
    t.uuid     "friend_two", null: false
    t.integer  "method",     null: false
    t.datetime "created_at"
  end

  add_index "relationships", ["friend_one"], name: "index_relationships_on_friend_one", using: :btree
  add_index "relationships", ["friend_two"], name: "index_relationships_on_friend_two", using: :btree
  add_index "relationships", ["method"], name: "index_relationships_on_method", using: :btree

  create_table "reviews", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid      "user_id"
    t.string    "emoji",                                                                                  null: false
    t.integer   "kind",                                                                       default: 0, null: false
    t.string    "source",                                                                                 null: false
    t.geography "lonlat",            limit: {:srid=>4326, :type=>"point", :geographic=>true},             null: false
    t.string    "loc_name"
    t.string    "thumbnail",                                                                              null: false
    t.string    "facebook_place_id"
    t.datetime  "created_at",                                                                             null: false
    t.datetime  "updated_at",                                                                             null: false
  end

  add_index "reviews", ["emoji"], name: "index_reviews_on_emoji", using: :btree
  add_index "reviews", ["facebook_place_id"], name: "index_reviews_on_facebook_place_id", using: :btree
  add_index "reviews", ["kind"], name: "index_reviews_on_kind", using: :btree
  add_index "reviews", ["source"], name: "index_reviews_on_source", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "state",                  default: 0,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fb_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["fb_id"], name: "index_users_on_fb_id", using: :btree
  add_index "users", ["id"], name: "index_users_on_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["state"], name: "index_users_on_state", using: :btree

  add_foreign_key "identities", "users"
  add_foreign_key "relationships", "users", column: "friend_one"
  add_foreign_key "relationships", "users", column: "friend_two"
  add_foreign_key "reviews", "users"
end
