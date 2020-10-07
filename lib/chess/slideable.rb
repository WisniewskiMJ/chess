# frozen_string_literal: true

require_relative 'movable'

module Slideable
  include Movable

  def moves
    directions = []
    (0...move_dirs.length).each do |idx|
      directions << move(idx) if move(idx) != @pos
    end
    directions = directions.uniq
    stretch_moves(directions)
  end

  private

  def stretch_moves(moves)
    stretched = []
    moves.each { |mov| stretched += stretch(mov) }
    stretched
  end

  def stretch(move)
    line = [move]
    step_x = move[0] - @pos[0]
    step_y = move[1] - @pos[1]
    next_step = stretch_next_step(line, step_x, step_y)
    while @board.on_chessboard?(next_step)
      line << next_step
      next_step = stretch_next_step(line, step_x, step_y)
    end
    line
  end

  def stretch_next_step(line, step_x, step_y)
    [line.last[0] + step_x, line.last[1] + step_y]
  end

  def move_diffs
    step_range = 1
    zero_horizontal_step = 0
    [step_range, zero_horizontal_step]
  end

  def move_dirs
    raise NotImplementedError
  end

  def diagonal_dirs
    move_permutations.select { |permutation| permutation[1] == permutation[3] }
  end

  def horizontal_dirs
    move_permutations.reject { |permutation| permutation[1] == permutation[3] }
  end

  def both_dirs
    diagonal_dirs + horizontal_dirs
  end
end
