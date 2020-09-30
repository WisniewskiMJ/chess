require_relative "piece"

class Board

  attr_accessor :pieces

  def initialize  
    @rows = Array.new(8) {Array.new(8,'x')}
    init_setup
  end

  #not in diagram
  def init_setup
   
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos,value)
    @rows[pos[0]][pos[1]] = value
  end

  def add_piece(pos) 
    piece = Piece.new(pos)
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

end
