# frozen_string_literal: true

# == Schema Information
#
# Table name: chess_matches
#
#  id              :integer          not null, primary key
#  fen             :string
#  active_player   :string
#  winning_player  :string
#  white_player_id :integer
#  black_player_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class ChessMatch < ApplicationRecord
  require 'chess/utf8_notation'
  include ActionView::Helpers::TextHelper

  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'

  def chess_game
    @chess_game ||= Chess::Game.load_fen(fen)
  end

  def to_utf8
    simple_format(chess_game.board.to_s.gsub(/\e\[([;\d]+)?m/, '').chars.map.with_index { |c, i| i < 150 ? c.to_utf8 : c }.join.gsub(' ', '&nbsp;'))
  end

  def player_in_game?(user)
    white_player == user || black_player == user
  end

  def my_turn?(user = current_user)
    user.username
  end
end
