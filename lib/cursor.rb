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
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor
  attr_reader :cursor_pos, :board, :selected, :piece_at_cursor_pos

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
    @piece_at_cursor_pos = nil
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false
    STDIN.raw!
    input = STDIN.getc.chr
    begin
      input << STDIN.read_nonblock(3)
    rescue StandardError
      nil
    end
    begin
      input << STDIN.read_nonblock(2)
    rescue StandardError
      nil
    end
    STDIN.echo = true
    STDIN.cooked!
    input
  end

  def handle_key(key)
    if %i[return space].include?(key)
      toggle_selected
      @piece_at_cursor_pos = (@cursor_pos if @selected)
      return @cursor_pos
    end

    if %i[left right up down].include?(key)
      update_pos(MOVES[key])
      return nil
    end

    return unless key == :ctrl_c

    Process.exit(0)
  end

  def toggle_selected
    piece = @board[@cursor_pos]
    if piece != NULL_PIECE && piece.valid_moves.empty?
      puts "You can't move that piece, it has no valid moves."
      @selected = false
    else
      @selected = !@selected
    end
  end

  def update_pos(diff)
    new_pos = [@cursor_pos[0] + diff[1], @cursor_pos[1] + diff[0]]
    return unless @board.pos_on_the_board?(new_pos)

    @cursor_pos = new_pos
  end
end
