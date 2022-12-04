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
        @cursor = Cursor.new([0,7], board)
        # @cursor = Cursor.new([0,0], a_whatever)
    end

    
    def display_border
        lines =  "--|----|----|----|----|----|----|----|----|--"
        puts lines
    end

    def display_row(row)
        result = "#{row} |" # result is "the number we passed in" + " "

        (0..7).each do |col| # we iterate through each coloumn of a row
            cursor_pos = @cursor.cursor_pos #we retrieve the cursor position 
            #the cursor position moves when we move the cursor and press other key on the keyboard that are not space or enter which selects

            letter = get_symbol_at_pos([col,row]) #we get the symbol at the col and row position

            
            if col == cursor_pos[0] && row == cursor_pos[1]
                # we get in this if statement if the position on the board, matches the cursor position
                bg = @cursor.selected ? :red : :blue
                #if the instance variable selected of the cursor is true (after a piece has been selectred)
                # we asign the colour red to where the cursor moves
                # when another position is selected, and selected is toggled we asign it to blue
                letter = letter.colorize(:background => bg) #we colorize the letter with the bg asigned in the if statement above
                
            end
            if @cursor.piece_at_cursor_pos != nil
                #true if the the @selected if true and piece_at)cursor_pos has been set the the position on the board where we have changed the @selected to true
                if get_valid_moves(@cursor.piece_at_cursor_pos).include?([col,row])
                    # we get the vaild moves of the piece selected
                    bg_letter = letter.colorize(:background => :green)
                    #if the position rendered is included in the valid moves we colour it green
                    result += " #{bg_letter} |"
                    next
                end
                
                # result += " #{letter} |"
            end
            
            result += " #{letter} |"
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
        if piece == NULL_PIECE 
            return "  "
        else  
            if piece.symbol.length == 2
                if piece.colour == :white
                    symbol = piece.symbol.to_s
                    return symbol.colorize(:yellow)
                end
                
                symbol = piece.symbol.to_s
                return symbol.colorize(:magenta)
            end

            if piece.colour == :white
                symbol = piece.symbol.to_s + " "
                return symbol.colorize(:yellow)
            end
            
            symbol = piece.symbol.to_s + " "
            return symbol.colorize(:magenta)
        end
        # return piece == :NullPiece ? ' ' : piece.symbol
    end

    def get_valid_moves(pos)
        piece = @board[pos]
        return piece.valid_moves
    end
end

# a_board = Board.new()
# a_display = Display.new(a_board)

# a_board.place_pieces()


# a_display.dispay_grid_with_y_axis()
