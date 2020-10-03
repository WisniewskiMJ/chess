require_relative "piece"

class Board

  attr_accessor :pieces

  def initialize  
    @rows = Array.new(8) {Array.new(8,'x')}
    init_setup
  end

  #not in diagram
  def init_setup
    (0..7).each do |x|
      (0..7).each do |y| 
        if x == 0 || x == 1 || x == 6 ||x == 7
          add_piece([x,y])
        else
          @rows[x][y] = nil
        end
      end
    end  
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos,value)
    @rows[pos[0]][pos[1]] = value
  end

  def add_piece(pos) 
    piece = Piece.new(pos, self)
    self[pos] = piece
  end

  def pieces
    pieces = []
    (0..7).each do |x|
      @rows[x].each_with_index do |field, y|
        pieces << @rows[x][y] if @rows[x][y].instance_of?(Piece)
      end
    end
    pieces  
  end

  # not in diagram
  def on_chessboard?(pos)
    return false if pos[0] < 0 || pos [0] > 7 || pos[1] < 0 || pos[1] > 7
    true
  end

  def move_piece(start_pos, end_pos)
    raise 'No piece at starting position' if !on_chessboard?(start_pos) || self[start_pos] == nil
    raise 'Can''t move to end position' if !on_chessboard?(end_pos) || self[end_pos] != nil
    piece = self[start_pos]
    piece.pos = end_pos
    if self[end_pos] == nil
      self[start_pos] = nil
      self[end_pos] = piece 
    end
  end

end
