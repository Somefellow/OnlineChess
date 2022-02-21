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
require 'test_helper'

class ChessMatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
