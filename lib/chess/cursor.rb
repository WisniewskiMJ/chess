# frozen_string_literal: true

require 'io/console'

KEYMAP = {
  ' ' => :space,
  'h' => :left,
  'j' => :down,
  'k' => :up,
  'l' => :right,
  'w' => :up,
  'a' => :left,
  's' => :down,
  'd' => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c
}.freeze

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}.freeze

class Cursor
  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
    # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
    # numeric keycode. chr returns a string of the
    # character represented by the keycode.
    # (e.g. 65.chr => "A")

    if input == "\e"
      begin
        input << STDIN.read_nonblock(3)
      rescue StandardError
        nil
      end # read_nonblock(maxlen) reads
      # at most maxlen bytes from a
      # data stream; it's nonblocking,
      # meaning the method executes
      # asynchronously; it raises an
      # error if no data is available,
      # hence the need for rescue

      begin
        input << STDIN.read_nonblock(2)
      rescue StandardError
        nil
      end
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    input
  end

  def handle_key(key)
    case key
    when :left, :right, :up, :down
      update_pos(MOVES[key])
      nil
    when :return, :space
      toggle_selected
      @cursor_pos
    when :ctrl_c
      Process.exit(0)
    end
  end

  def update_pos(diff)
    new_cursor_pos = @cursor_pos.dup
    new_cursor_pos[0] += diff[0]
    new_cursor_pos[1] += diff[1]
    if @board.on_chessboard?(new_cursor_pos)
      @cursor_pos = new_cursor_pos
    else
      puts "You can't move outside chessboard"
    end
  end

  def toggle_selected
    if @board[@cursor_pos].is_a?(Piece) && @selected == false
      @selected = true
    elsif !@board[cursor_pos].is_a?(Piece) && @selected == true
      @selected = false
    end
  end
end
