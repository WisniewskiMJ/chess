# frozen_string_literal: true

module Movable
  def moves
    moves = []
    (0...move_dirs.length).each do |idx|
      moves << move(idx)
    end
    moves
  end

  # private

  def move_permutations
    move_permutations = []
    operator_and_part_pairs.each do |pair1|
      operator_and_part_pairs.each do |pair2|
        move_permutations << pair1 + pair2
      end
    end
    move_permutations
  end

  def operator_and_part_pairs
    operators = %i[+ -]
    move_parts = move_diffs
    operator_and_part_pairs = []
    operators.each do |operator|
      move_parts.each do |part|
        operator_and_part_pairs << [operator, part]
      end
    end
    operator_and_part_pairs
  end

  def single_move_direction(idx)
    move_dirs[idx]
  end

  def move(idx)
    x_operator = single_move_direction(idx)[0]
    y_operator = single_move_direction(idx)[2]
    x_move_part = single_move_direction(idx)[1]
    y_move_part = single_move_direction(idx)[3]
    move_x = @pos[0].send(x_operator, x_move_part)
    move_y = @pos[1].send(y_operator, y_move_part)
    [move_x, move_y]
  end
end
