require './board'
require './game'

class Piece
    attr_reader :pos, :colour, :symbol 

    def initialize(board, start_pos, colour, symbol)
        @board = board
        @pos = start_pos
        @colour = colour 
        @symbol = symbol
    end

    def colour_dir
        self.colour == :white ? return 1 : return -1 
    end

#     def moves
#         # returns an array of places a piece can move
#         # we need the pieces subclases to implement this method
#         # HOW DO WE ACCES THE PIECES SUBCLASES?
#         # will use #move_dirs for pieces that include the Slidable module
#         # will use #move_diff for pices that include the Stepable module
#     end

#     def to_s

#     end

#     def empty?

#     end

#     def valid_moves?

#     end

#     def pos=(val)

#     end

#     def symbol

#     end

#     def move_into_check(end_pos)

#     end
end
