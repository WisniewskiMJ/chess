# frozen_string_literal: true

module Stepable

  def moves
    moves = []
    move_diffs.each do |diff|
      move_x = @pos[0] + diff[0]
      move_y = @pos[1] + diff[1]
      moves << [move_x, move_y]
    end
    moves
  end
end
