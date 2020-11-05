# frozen_string_literal: true

module Slideable
  def moves
    directions = []
    move_dirs.each do |dir|
      move_x = @pos[0] + dir[0]
      move_y = @pos[1] + dir[1]
      directions << [move_x, move_y]
    end
    stretch_moves(directions)
  end

  private

  def stretch_moves(directions)
    stretched = []
    directions.each { |dir| stretched += stretch(dir) }
    stretched
  end

  def stretch(move)
    if @board.on_chessboard?(move) && @board.valid_target?(move, @color)
      line = [move]
      return line if @board.attack?(move, @color)

      step_x = move[0] - @pos[0]
      step_y = move[1] - @pos[1]
      next_step = stretch_next_step(line, step_x, step_y)
      while @board.on_chessboard?(next_step) && @board.valid_target?(next_step, @color)
        line << next_step
        break if @board.attack?(next_step, @color)

        next_step = stretch_next_step(line, step_x, step_y)
      end
    else
      line = []
    end
    line
  end

  def stretch_next_step(line, step_x, step_y)
    [line.last[0] + step_x, line.last[1] + step_y]
  end

  def move_dirs
    raise NotImplementedError
  end

  def diagonal_dirs
    [[1, 1],
     [1, -1],
     [-1, 1],
     [-1, -1]]
  end

  def horizontal_dirs
    [[0, 1],
     [0, -1],
     [1, 0],
     [-1, 0]]
  end

  def both_dirs
    diagonal_dirs + horizontal_dirs
  end
end
