require_relative "movable"

module Stepable
  include Movable

def moves
  directions = permutations.select.with_index {|e| e[1] != e[3]}
  moves = []
  (0...directions.length).each do |n|
    moves << [@pos[0].send(directions[n][0],directions[n][1]),@pos[1].send(directions[n][2],directions[n][3])]
  end
  moves
end

private

  def move_diffs
    [step_x, step_y]
  end

end
