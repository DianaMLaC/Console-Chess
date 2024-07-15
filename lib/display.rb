require_relative 'cursor'
require 'colorize'

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 7], board)
  end

  def display_border
    lines = '--|----|----|----|----|----|----|----|----|--'
    puts lines
  end

  def display_row(row)
    result = "#{row} |"

    (0..7).each do |col|
      cursor_pos = @cursor.cursor_pos
      letter = get_symbol_at_pos([col, row])

      if col == cursor_pos[0] && row == cursor_pos[1]
        bg = @cursor.selected ? :red : :blue
        letter = letter.colorize(background: bg)
      end

      if !@cursor.piece_at_cursor_pos.nil? && get_valid_moves(@cursor.piece_at_cursor_pos).include?([col, row])
        bg_letter = letter.colorize(background: :green)
        result += " #{bg_letter} |"
        next
      end

      result += " #{letter} |"
    end
    puts result
  end

  def display_x_axis
    puts 'C/R  0    1    2    3    4    5    6    7    '
  end

  def render
    puts `clear`
    display_x_axis
    display_border
    (0..7).each do |row|
      display_row(row)
      display_border
    end
  end

  private

  def get_symbol_at_pos(pos)
    piece = @board[pos]
    return '  ' if piece == NULL_PIECE

    if piece.symbol.length == 2
      symbol = piece.symbol.to_s
      piece.colour == :white ? symbol.colorize(:yellow) : symbol.colorize(:magenta)
    else
      symbol = piece.symbol.to_s + ' '
      piece.colour == :white ? symbol.colorize(:yellow) : symbol.colorize(:magenta)
    end
  end

  def get_valid_moves(pos)
    piece = @board[pos]
    piece != :NullPiece ? piece.valid_moves : []
  end
end
