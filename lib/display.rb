require_relative 'cursor'
require 'colorize'

# require 'whatever' OR I write it below
# class Whatever
#   def pos_on_the_board?(pos)
#     return true
#   end
# end

# a_whatever = Whatever.new


class Display 
    attr_reader :cursor

    def initialize(board)
        @board = board 
        @cursor = Cursor.new([0,0], board)
        # @cursor = Cursor.new([0,0], a_whatever)
    end

    
    def display_border
        lines =  "--|----|----|----|----|----|----|----|----|--"
        puts lines
    end

    def display_row(row)
        result = "#{row} |"

        (0..7).each do |col|
            cursor_pos = @cursor.cursor_pos
            letter = get_symbol_at_pos([col,row])

            # if [col, row] == cursor_pos
            if col == cursor_pos[0] && row == cursor_pos[1]
                bg = @cursor.selected ? :red : :blue
                letter = letter.to_s.colorize(:background => bg)
            end

            extra_space = letter.length == 2 ? '' : ' '
            result += " #{letter} #{extra_space}|"
        end
        # result =  "#{row} | #{@board.get_symbol_at_pos([0,row])}  | #{@board.get_symbol_at_pos([1,row])}  | #{@board.get_symbol_at_pos([2,row])}  | #{@board.get_symbol_at_pos([3,row])}  |    |    |    |    |  "  
        puts result
    end

       
    def display_x_axis
        puts "C/R  0    1    2    3    4    5    6    7    "
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
        return piece == :NullPiece ? ' ' : piece.symbol
    end
end

# a_board = Board.new()
# a_display = Display.new(a_board)

# a_board.place_pieces()


# a_display.dispay_grid_with_y_axis()
