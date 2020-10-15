# frozen_string_literal: true

class Pawn < Piece
  def set_color
    @pos[0] == 1 ? :black : :white
  end

  def set_symbol
    @color == :black ? :p : :P
  end

  def moves
    moves = []
    move_dirs.each do |dir|
      next_x = @pos[0] + dir[0]
      next_y = @pos[1] + dir[1]
      move = [next_x, next_y]
      moves << move
    end
    moves
  end

  def move_dirs
    left = @color == :black ? 1 : -1
    right = @color == :white ? 1 : -1

    directions = []
    directions << forward_steps[0]
    directions << forward_steps[1] if at_start_row?
    directions << side_attacks(left) if attack_possible?(left)
    directions << side_attacks(right) if attack_possible?(right)
    directions
  end

  # private

  def at_start_row?
    return true if @color == :black && @pos[0] == 1
    return true if @color == :white && @pos[0] == 6

    false
  end

  def attack_possible?(direction)
    field_check = @board[[@pos[0] + forward_dir, @pos[1] + direction]]
    field_check.is_a?(Piece) && field_check.color != @color
  end

  def forward_dir
    @color == :black ? 1 : -1
  end

  def forward_steps
    [[forward_dir, 0], [forward_dir * 2, 0]]
  end

  def side_attacks(direction)
    [forward_dir, direction]
  end
end
