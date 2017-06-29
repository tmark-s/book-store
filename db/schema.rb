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

ActiveRecord::Schema.define(version: 20170629035724) do

  create_table "books", force: :cascade do |t|
    t.string  "title"
    t.string  "author"
    t.float   "price"
    t.text    "description"
    t.integer "category_id"
    t.string  "image"
  end

  create_table "categories", force: :cascade do |t|
    t.string "categoryname"
  end

  create_table "checkouts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.text    "address"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.date    "created_on"
    t.text    "address"
  end

  create_table "shippingaddresses", force: :cascade do |t|
    t.integer "user_id"
    t.text    "address"
  end

  create_table "shoppingcarts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context"
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id"
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type"
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string  "firstname"
    t.string  "lastname"
    t.date    "dateofbirth"
    t.text    "address"
    t.string  "image"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
    t.text    "freq_tag"
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
  end

end
