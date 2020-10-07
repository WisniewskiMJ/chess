# frozen_string_literal: true

module Stepable
  include Movable

  private

  def move_dirs
    step_directions
  end

  def step_directions
    move_permutations.reject { |permutation| permutation[1] == permutation[3] }
  end

  def move_diffs
    raise NotImplementedError
  end
end
