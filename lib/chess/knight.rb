# frozen_string_literal: true

class Knight < Piece
  include Stepable

  def initialize(pos, board)
    super
  end

  def move_diffs
    step_x = 2
    step_y = 1
    [step_x, step_y]
  end
end
