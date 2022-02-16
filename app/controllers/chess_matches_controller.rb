# frozen_string_literal: true

class ChessMatchesController < ApplicationController
  before_action :find_chess_match
  before_action :require_to_be_player

  private

  def find_chess_match
    @chess_match = ChessMatch.find(params[:id])
  end

  def require_to_be_player
    return if @chess_match.nil? || !@chess_match.player_in_game?(@current_user)

    flash[:error] = 'You must be a player in this game to access this section'
    redirect_to root_path
  end
end
