# frozen_string_literal: true

# require_relative 'piece'
# require_relative 'slideable'

class Rook < Piece
  include Slideable

  def initialize(pos, board)
    super
  end

  def move_dirs
    horizontal_dirs
  end
end
