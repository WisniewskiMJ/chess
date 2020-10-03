module Stepable

def moves
  elements = [:-,:+,move_diffs[0],move_diffs[1]]
  elements += elements
  mix = elements.permutation.to_a.uniq
  permutations = [] 
  mix.each do |p|
    p_even = p.select.with_index {|el, i| i.even?}
    permutations << p if !permutations.include?(p) && p_even.all? {|e| e.instance_of?(Symbol)} 
  end
  (0...permutations.length).each do |n|
    permutations.push(permutations.shift[0..3])
  end
  permutations = permutations.uniq
  stepable_permutations = permutations.select.with_index {|e| e[1] != e[3]}
  moves = []
  (0...stepable_permutations.length).each do |n|
    moves << [@pos[0].send(stepable_permutations[n][0],stepable_permutations[n][1]),@pos[1].send(stepable_permutations[n][2],stepable_permutations[n][3])]
  end
  moves
end

private

  def move_diffs
    [step_x, step_y]
  end

end
