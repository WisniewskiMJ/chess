require_relative "movable"
require "byebug"

module Slideable
  include Movable

  def moves
    directions = move_dirs
    moves = []
    (0...directions.length).each do |n|
      new_pos = [@pos[0].send(directions[n][0],directions[n][1]),@pos[1].send(directions[n][2],directions[n][3])] 
      moves << new_pos if new_pos != @pos
    end
    moves = moves.uniq
    stretch_moves(moves)
  end

  private

  def stretch_moves(moves)
    lines = []
    steps = moves.map {|mov| [mov[0] - @pos[0], mov[1] - @pos[1]]}
    moves.each_with_index do |dir, idx|
      line = [moves[idx]]
      new_pos = [line[-1][0] + steps[idx][0], line[-1][1] + steps[idx][1]] 
      until !@board.on_chessboard?(new_pos)
        line << new_pos
      new_pos = [line[-1][0] + steps[idx][0], line[-1][1] + steps[idx][1]] 
      end
      lines += line
    end
    lines
  end

  def move_diffs
    step_x = 1
    step_y = 0
    diffs = [step_x, step_y]
  end

  def move_dirs
    raise NotImplementedError
  end

  def diagonal_dirs
    directions = permutations.select.with_index {|e| e[1] == e[3]}
  end
 
  def horizontal_dirs
    directions = permutations.select.with_index {|e| e[1] != e[3]}
  end

  def both_dirs
    directions = diagonal_dirs + horizontal_dirs
  end

end
