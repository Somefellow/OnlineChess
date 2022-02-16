# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_216_105_120) do
  create_table 'chess_matches', force: :cascade do |t|
    t.string 'fen'
    t.string 'active_player'
    t.string 'winning_player'
    t.integer 'white_player_id'
    t.integer 'black_player_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['black_player_id'], name: 'index_chess_matches_on_black_player_id'
    t.index ['white_player_id'], name: 'index_chess_matches_on_white_player_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'chess_matches', 'users', column: 'black_player_id'
  add_foreign_key 'chess_matches', 'users', column: 'white_player_id'
end
