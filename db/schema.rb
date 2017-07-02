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

ActiveRecord::Schema.define(version: 5) do

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurant_foods", force: :cascade do |t|
    t.float "cost"
    t.integer "review_id"
    t.integer "restaurant_id"
    t.integer "food_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["food_id"], name: "index_restaurant_foods_on_food_id"
    t.index ["restaurant_id"], name: "index_restaurant_foods_on_restaurant_id"
    t.index ["review_id"], name: "index_restaurant_foods_on_review_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "cuisine"
    t.integer "cost_range"
    t.string "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "stars"
    t.integer "user_id"
    t.integer "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "contact_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
