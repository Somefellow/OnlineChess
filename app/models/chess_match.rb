# frozen_string_literal: true

class ChessMatch < ApplicationRecord
  require 'chess/utf8_notation'
  include ActionView::Helpers::TextHelper

  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'

  def chess_game
    @chess_game ||= Chess::Game.load_fen(fen)
  end

  def to_utf8
    simple_format(chess_game.board.to_s.gsub(/\e\[([;\d]+)?m/, '').chars.map(&:to_utf8).join)
  end

  def player_in_game?(user)
    white_player == user || black_player == user
  end
end
