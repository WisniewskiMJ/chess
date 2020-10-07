# frozen_string_literal: true

require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def initialize(pos, board)
    super
  end

  def move_dirs
    diagonal_dirs
  end
end
