# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_01_045721) do

  create_table "datee", id: false, force: :cascade do |t|
    t.integer "d1"
    t.integer "d2"
  end

# Could not dump table "dateme" because of following StandardError
#   Unknown type 'REAL' for column 'd2'

  create_table "datemme", id: false, force: :cascade do |t|
    t.integer "d1"
    t.text "d2"
  end

# Could not dump table "datetime_real" because of following StandardError
#   Unknown type 'REAL' for column 'd1'

  create_table "games", force: :cascade do |t|
    t.string "username"
    t.integer "no_of_clicks"
    t.text "time_taken"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "flagged_mine", default: 0
    t.integer "sweep_count", default: 0
    t.integer "score"
  end

  create_table "mines", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.integer "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_mines_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "no_of_clicks"
    t.text "time_taken"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tiles", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.boolean "flagged", default: false
    t.boolean "cleared", default: false
    t.integer "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "count_touching_mine"
    t.index ["game_id"], name: "index_tiles_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "highscore"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "mines", "games"
  add_foreign_key "tiles", "games"
end
