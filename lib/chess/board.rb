# frozen_string_literal: true

class Board
  attr_reader :rows

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

  def move_piece(start_pos, end_pos)
    raise 'No piece at starting position' if !on_chessboard?(start_pos) || self[start_pos].nil?
    if !self[start_pos].valid_moves.include?(end_pos)
      raise "Can't move to end position"
    end

    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
    piece.pos = end_pos
  end

  def move_piece!(start_pos, end_pos)
    raise 'No piece at starting position' if !on_chessboard?(start_pos) || self[start_pos].nil?
    if !on_chessboard?(end_pos) || !valid_target?(end_pos, self[start_pos].color) || !self[start_pos].moves.include?(end_pos)
      raise "Can't move to end position"
    end

    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
    piece.pos = end_pos
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

  def valid_target?(pos, color)
    if !self[pos].is_a?(Piece)
      true
    else
      self[pos].color != color
    end
  end

  def in_check?(color)
    king_position = find_king(color)
    rows.flatten.each do |field|
      return true if field.is_a?(Piece) && field.moves.include?(king_position) && field.color != color
    end
    false
  end

  def checkmate?(color)
    pieces.any? do |piece|
      piece.valid_moves.length > 0 && piece.color == color
    end
  end

  def find_king(color)
    rows.flatten.each do |field|
      return field.pos if field.is_a?(King) && field.color == color
    end
  end

  def board_dup
    serialized_board = Marshal.dump(self)
    Marshal.load(serialized_board)
  end
end
