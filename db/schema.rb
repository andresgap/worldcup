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

ActiveRecord::Schema[7.0].define(version: 2019_10_25_130752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitations", force: :cascade do |t|
    t.integer "leaderboard_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "leaderboards", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "owner_id"
    t.boolean "active", default: true
    t.boolean "private", default: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "leaderboards_users", id: false, force: :cascade do |t|
    t.bigint "leaderboard_id", null: false
    t.bigint "user_id", null: false
    t.index ["leaderboard_id", "user_id"], name: "index_leaderboards_users_on_leaderboard_id_and_user_id"
    t.index ["user_id", "leaderboard_id"], name: "index_leaderboards_users_on_user_id_and_leaderboard_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "number"
    t.datetime "date", precision: nil
    t.integer "phase_id"
    t.integer "team1_id"
    t.integer "team2_id"
    t.integer "team1_score"
    t.integer "team2_score"
    t.string "team1_label"
    t.string "team2_label"
    t.boolean "ready", default: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "tournament_id"
    t.boolean "is_closed", default: false
  end

  create_table "phases", force: :cascade do |t|
    t.string "code"
    t.integer "level"
    t.integer "small_points"
    t.integer "big_points"
    t.boolean "active"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "tournament_id"
  end

  create_table "prediction_sets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "points", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "tournament_id"
  end

  create_table "predictions", force: :cascade do |t|
    t.integer "prediction_set_id"
    t.integer "match_id"
    t.integer "score1"
    t.integer "score2"
    t.integer "points"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "code"
    t.string "group"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "active", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "picture"
    t.string "image"
    t.boolean "active", default: true
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
