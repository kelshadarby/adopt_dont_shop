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

ActiveRecord::Schema.define(version: 20200401222007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adoption_pets", force: :cascade do |t|
    t.bigint "adoption_id"
    t.bigint "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adoption_id"], name: "index_adoption_pets_on_adoption_id"
    t.index ["pet_id"], name: "index_adoption_pets_on_pet_id"
  end

  create_table "adoptions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "description"
  end

  create_table "pets", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "description"
    t.string "approximate_age"
    t.string "sex"
    t.string "adoption_status"
    t.integer "shelter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "rating"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shelter_id"
    t.string "picture"
    t.index ["shelter_id"], name: "index_reviews_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.bigint "review_id"
    t.index ["review_id"], name: "index_shelters_on_review_id"
  end

  add_foreign_key "adoption_pets", "adoptions"
  add_foreign_key "adoption_pets", "pets"
  add_foreign_key "reviews", "shelters"
  add_foreign_key "shelters", "reviews"
end
