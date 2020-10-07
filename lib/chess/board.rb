# frozen_string_literal: true

class Board
  def initialize
    @rows = Array.new(8) { Array.new(8, 'x') }
    init_setup
  end

  # not in diagram
  def init_setup
    populated_rows = [0, 1, 6, 7]
    (0..7).each do |x|
      (0..7).each do |y|
        if populated_rows.include?(x)
          add_piece([x, y])
        else
          @rows[x][y] = nil
        end
      end
    end
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @rows[pos[0]][pos[1]] = value
  end

  def add_piece(pos)
    piece = Piece.new(pos, self)
    self[pos] = piece
  end

  def pieces
    pieces = []
    (0..7).each do |x|
      @rows[x].each_with_index do |_field, y|
        pieces << @rows[x][y] if @rows[x][y].instance_of?(Piece)
      end
    end
    pieces
  end

  # not in diagram
  def on_chessboard?(pos)
    if pos[0].negative? || pos [0] > 7 || pos[1].negative? || pos[1] > 7
      return false
    end

    true
  end

  def move_piece(start_pos, end_pos)
    if !on_chessboard?(start_pos) || self[start_pos].nil?
      raise 'No piece at starting position'
    end
    if !on_chessboard?(end_pos) || !self[end_pos].nil?
      raise "Can't move to end position"
    end

    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
  end
end
