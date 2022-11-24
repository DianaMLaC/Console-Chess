require_relative 'board'

class Display  

    def initialize(board)
        @board = board 
    end

    

        # puts "col  0    1    2    3    4    5    6    7    "
        # puts "--|----|----|----|----|----|----|----|----|--"
        # puts "0 |    |    |    |    |    |    |    |    |  "
        # puts "--|----|----|----|----|----|----|----|----|--"
        # puts "1 |    |    |    |    |    |    |    |    |  "
        # puts "--|----|----|----|----|----|----|----|----|--"
        # puts "2 |    |    |    |    |    |    |    |    |  "
        # puts "--|----|----|----|----|----|----|----|----|--"
        # puts "3 |    |    |    |    |    |    |    |    |  "
        # puts "--|----|----|----|----|----|----|----|----|--"
        # puts "4 |    |    |    |    |    |    |    |    |  "
        # puts "--|----|----|----|----|----|----|----|----|--"
        # puts "5 |    |    |    |    |    |    |    |    |  "
        # puts "--|----|----|----|----|----|----|----|----|--"
        # puts "6 |    |    |    |    |    |    |    |    |  "
        # puts "--|----|----|----|----|----|----|----|----|--"
        # puts "7 |    |    |    |    |    |    |    |    |  "
        # puts "--|----|----|----|----|----|----|----|----|--"
        


        # one box is:

        # puts 9.times(lines)  "--|--"
        # puts 9.times(spaces) "  |  "

        # 8 times we replace the spaces last character with the symbol
        # 8 times we replace the spaces first character with numbers from range (0..7)


        # pieces white symbols are:
        # rook: ♖
        # knight: ♘
        # bishop: ♗
        # queen: ♕
        # king: ♔
        # pawn: ♙

        # pieces black symbols are:
        # rook: ♜
        # knight: ♞
        # bishop: ♝
        # queen: ♛
        # king: ♚
#         # pawn: ♟
#     def display_border
#         lines =  "--|----|----|----|----|----|----|----|----|--"
#         puts lines
#     end

#     def display_separator(num)
#         spaces = "#{num} |"
#         (0..7).each do |col|
#             letter = get_symbol_at_pos([col,num])
#             extra_space = letter.length == 2 ? '' : ' '
#             spaces += " #{letter} #{extra_space}|"
#         end
#         # spaces =  "#{num} | #{@board.get_symbol_at_pos([0,num])}  | #{@board.get_symbol_at_pos([1,num])}  | #{@board.get_symbol_at_pos([2,num])}  | #{@board.get_symbol_at_pos([3,num])}  |    |    |    |    |  "  
#         puts spaces
#     end

       
#     def display_x_axis
#         puts "C/R  0    1    2    3    4    5    6    7    "
#     end

#     def dispay_grid_with_y_axis
#         display_x_axis
#         display_border
#         (0..7).each do |y|
#             display_separator(y)
#             display_border
#         end
#     end

#     private

#     def get_symbol_at_pos(pos)
#         piece = @board[pos]
#         return piece == :NullPiece ? ' ' : piece.symbol
#     end
# end

# a_board = Board.new()
# a_display = Display.new(a_board)

# a_board.place_pieces()


# a_display.dispay_grid_with_y_axis()
