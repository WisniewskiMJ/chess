# frozen_string_literal: true

class Queen < Piece
  include Slideable

  def set_color
    (@pos[0]).zero? ? :black : :white
  end

  def set_symbol
    @color == :black ? :q : :Q
  end

  def move_dirs
    both_dirs
  end
end
