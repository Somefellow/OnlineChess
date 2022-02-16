# frozen_string_literal: true

class CreateChessMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :chess_matches do |t|
      t.string :fen
      t.string :active_player
      t.string :winning_player
      t.references :white_player
      t.references :black_player
      t.timestamps
    end

    add_foreign_key :chess_matches, :users, column: :white_player_id, primary_key: :id
    add_foreign_key :chess_matches, :users, column: :black_player_id, primary_key: :id
  end
end
