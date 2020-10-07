# frozen_string_literal: true

require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def initialize(pos, board)
    super
  end

  def move_dirs
    both_dirs
  end
end
