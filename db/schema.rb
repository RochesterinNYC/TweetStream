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

ActiveRecord::Schema.define(version: 20131211201153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "broadcast_messages", force: true do |t|
    t.string   "message"
    t.integer  "admin_id"
    t.string   "users_viewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: true do |t|
    t.string   "keywords"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "radius"
    t.string   "results_summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "x_score"
    t.decimal  "y_score"
  end

  create_table "tweets", force: true do |t|
    t.datetime "tweet_created_at"
    t.string   "id_str"
    t.string   "text"
    t.string   "source"
    t.string   "user_id_str"
    t.string   "user_screen_name"
    t.string   "user_location"
    t.string   "user_description"
    t.string   "user_url"
    t.integer  "user_followers_count"
    t.string   "user_friends_count"
    t.string   "user_profile_image_url"
    t.string   "longitude"
    t.string   "latitude"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "raw_text"
    t.text     "tweet_hash"
    t.integer  "user_id"
    t.integer  "search_id"
  end

  add_index "tweets", ["search_id"], name: "index_tweets_on_search_id", using: :btree
  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree

  create_table "user_profiles", force: true do |t|
    t.integer  "twitter_id"
    t.string   "id_str"
    t.string   "name"
    t.string   "screen_name"
    t.string   "location"
    t.string   "description"
    t.string   "url"
    t.boolean  "protected"
    t.integer  "followers_count"
    t.integer  "friends_count"
    t.integer  "listed_count"
    t.datetime "user_created_at"
    t.integer  "favourites_count"
    t.string   "time_zone"
    t.boolean  "geo_enabled"
    t.integer  "statuses_count"
    t.string   "profile_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "raw_text"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type",         default: "UNCONFIRMED"
    t.string   "provider"
    t.string   "uid"
    t.string   "profile_image_url"
    t.string   "oauth_token"
    t.string   "oauth_secret"
  end

end
