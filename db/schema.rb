# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_14_013427) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "user_id"
    t.integer "priority"
  end

  create_table "show_tags", force: :cascade do |t|
    t.integer "show_id"
    t.integer "tag_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.integer "episodes"
    t.integer "episodes_watched"
    t.integer "rating"
    t.integer "user_id"
    t.integer "category_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
  end

end
