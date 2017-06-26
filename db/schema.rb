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

ActiveRecord::Schema.define(version: 20170626042136) do

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

  create_table "users", force: :cascade do |t|
    t.string  "firstname"
    t.string  "lastname"
    t.date    "dateofbirth"
    t.text    "address"
    t.string  "image"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
  end

end
