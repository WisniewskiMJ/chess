# frozen_string_literal: true

class Knight < Piece
  include Stepable

  def set_color
    (@pos[0]).zero? ? :black : :white
  end

  def set_symbol
    @color == :black ? :n : :N
  end

  def move_diffs
    step_x = 2
    step_y = 1
    [step_x, step_y]
  end
end
