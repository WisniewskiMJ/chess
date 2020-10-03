module Movable

  def permutations
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
  end

end
