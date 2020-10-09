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
    piece_positions = { Rook => [0, 7], Knight => [1, 6], Bishop => [2, 5], Queen => [3], King => [4] }
    if pos[0] == 1 || pos[0] == 6
      piece = Pawn.new(pos, self)
    elsif piece_positions.each do |piece_class, position|
            piece = piece_class.new(pos, self) if position.include?(pos[1])
          end
    end
    self[pos] = piece
  end

  def pieces
    pieces = []
    (0..7).each do |x|
      @rows[x].each_with_index do |_field, y|
        pieces << @rows[x][y] if @rows[x][y].is_a?(Piece)
      end
    end
    pieces
  end

  # not in diagram
  def on_chessboard?(pos)
    return false if pos[0].negative? || pos [0] > 7 || pos[1].negative? || pos[1] > 7

    true
  end

  def move_piece(start_pos, end_pos)
    raise 'No piece at starting position' if !on_chessboard?(start_pos) || self[start_pos].nil?
    raise "Can't move to end position" if !on_chessboard?(end_pos) || !self[end_pos].nil?

    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
    piece.pos = end_pos
  end
end
