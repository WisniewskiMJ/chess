require_relative "movable"

module Slideable
  include Movable

  def moves
    directions = move_dirs
    moves = []
    (0...directions.length).each do |n|
      new_pos = [@pos[0].send(directions[n][0],directions[n][1]),@pos[1].send(directions[n][2],directions[n][3])] 
      moves << new_pos if new_pos != @pos
    end
    moves.uniq
  end

  private

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

end
