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

ActiveRecord::Schema.define(version: 2019_11_13_201318) do

  create_table "show_tags", force: :cascade do |t|
    t.integer "show_id"
    t.integer "tag_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.integer "episodes"
    t.integer "episodes_watched"
    t.integer "rating"
    t.string "user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
  end

  create_table "test", force: :cascade do |t|
    t.string "ping"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
  end

end
