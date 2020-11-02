# frozen_string_literal: true

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def run
    loop do
      render
      @cursor.get_input
    end
  end

  def render
    puts
    @board.rows.each_with_index do |row, x|
      print '     '
      row.each_with_index do |field, y|
        if field.is_a?(Piece)
          if @cursor.cursor_pos == [x, y]
            print "#{field.symbol} ".colorize(field.color).on_magenta
          elsif white_field?(x, y)
            print "#{field.symbol} ".colorize(field.color).on_light_yellow
          else
            print "#{field.symbol} ".colorize(field.color).on_light_red
          end
        else
          if @cursor.cursor_pos == [x, y]
            print 'p '.colorize(:magenta).on_magenta
          elsif white_field?(x, y)
            print 'p '.colorize(:light_yellow).on_light_yellow
          else
            print 'p '.colorize(:light_red).on_light_red
          end
        end
      end
      puts
    end
    puts
    nil
  end

  private

  def white_field?(x, y)
    (x.even? && y.even?) || (x.odd? && y.odd?)
  end
end
