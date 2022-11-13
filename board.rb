require './piece.rb'

class Board
    def initialize
        # the board lookup should always be looked up [row][col]
        @grid = Array.new(8) {Array.new(8, :NullPiece)}
    end

    def [](pos)
        col, row = pos # [col, row] makes the position given by the player
        @grid[row][col] # but this is how the computer will read it
    end

    # test
    def []=(pos, piece)
        #if people give intructions as [col, row], 
        #but computer acceses the position on the grid with [row][col]
        #then we shoul set it like that
        col, row = pos
        @grid[row][col] = piece 
    end

    # WE need to place pieces on the board based on their colour position and piece like a human would
    # let's start row by row
    def place_white_row
        @grid[7][0] = Rook.new(self, [0,7], :white)
        @grid[7][1] = Knight.new(self, [1,7], :white)
        @grid[7][2] = Bishop.new(self, [2,7], :white)
        @grid[7][3] = Queen.new(self, [3,7], :white)
        @grid[7][4] = King.new(self, [4,7], :white)
        @grid[7][5] = Bishop.new(self, [5,7], :white)
        @grid[7][6] = Knight.new(self, [6,7], :white)
        @grid[7][7] = Rook.new(self, [7,7], :white)
    end

    def place_black_row
        @grid[0][0] = Rook.new(self, [0,0], :black)
        @grid[0][1] = Knight.new(self, [1,0], :black)
        @grid[0][2] = Bishop.new(self, [2,0], :black)
        @grid[0][3] = Queen.new(self, [3,0], :black)
        @grid[0][4] = King.new(self, [4,0], :black)
        @grid[0][5] = Bishop.new(self, [5,0], :black)
        @grid[0][6] = Knight.new(self, [6,0], :black)
        @grid[0][7] = Rook.new(self, [7,0], :black)
    end

    def place_black_pawns
        @grid[6][0] = Pawn.new(self, [0,6], :white)
        @grid[6][1] = Pawn.new(self, [1,6], :white)
        @grid[6][2] = Pawn.new(self, [2,6], :white)
        @grid[6][3] = Pawn.new(self, [3,6], :white)
        @grid[6][4] = Pawn.new(self, [4,6], :white)
        @grid[6][5] = Pawn.new(self, [5,6], :white)
        @grid[6][6] = Pawn.new(self, [6,6], :white)
        @grid[6][7] = Pawn.new(self, [7,6], :white)
    end

    def place_white_pawns
        @grid[1][0] = Pawn.new(self, [0,1], :black)
        @grid[1][1] = Pawn.new(self, [1,1], :black)
        @grid[1][2] = Pawn.new(self, [2,1], :black)
        @grid[1][3] = Pawn.new(self, [3,1], :black)
        @grid[1][4] = Pawn.new(self, [4,1], :black)
        @grid[1][5] = Pawn.new(self, [5,1], :black)
        @grid[1][6] = Pawn.new(self, [6,1], :black)
        @grid[1][7] = Pawn.new(self, [7,1], :black)
      
    end


    def place_pieces # A function to place all pieces on the board
        Board.place_white_row
        Board.place_black_row
        Board.place_white_pawns
        Board.place_black_pawns
    end

    def is_empty?(pos)
        col, row = pos
        if @grid[row][col] != :NullPiece
            return false
        end
        return true
    end

    def pos_valid?(pos)
        col, row = pos
        
        if row < 0 || row > 7
            raise "Invalid position"
            return false
        end
        if col < 0 || col > 7)
            raise "Invalid position"
            return false
        end
    end

    def move_piece(piece)
        # we take the piece's available moves , and we check if each one:
        # is empty
            # checks if opposit colour for attack
            # for pieces that cannot step over, we only consider positions from array  until those occupied
        # is valid(on the board)
        # and we only consider those that are as a possible move
    end

        
#         if !@grid[row][col].nil? 
#             # we want to check if the piece on the position is of opossite colour

#             # if it is opposite colour and is_valid_move? 
#             #return true but also add a point(or the piece of opposite colour) to the player points board.
#             return false
#         end
        
#         # if the position is nil, or the opposite colour, and it's in the grid, and a valid move
#         # we move_piece
#         return true
#     end
    
#     def is_valid_move?(start_pos, end_pos, piece)
#         # we want to check if the end position is a valid move for the piece we're moving
#         #maybe this method would go in the Piece class, and then the piece arg would be self
#         col, row = start_pos
#         piece = grid[row][col]
#         #the piece, would have a list of possible moves 
#         # which when added to our start_pos 
#         # one of the results should match our end_pos
#         # if the results includes end_pos
#         return true
#     end
# end
