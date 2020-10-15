# frozen_string_literal: true

class Display
  def initialize(board)
    @board = board
  end

  def render
    puts
    @board.rows.each do |row|
      print '     '
      row.each do |field|
        if field.is_a?(Piece)
          print "#{field.color} "
        else
          print '_ '
        end
      end
      puts
    end
    puts
    nil
  end
end
