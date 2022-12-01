require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'
require_relative 'pieces/queen'
require_relative 'pieces/rook'

require_relative 'constants'


# old_board = Board.new()
# queen = Queen.new(old_board, [3,7], :white)
# duplicate_queen = Queen.new(new_board, [3,7], :white)

# new_board = Board.new(old_board)
# new_board.move_piece([[3,7],[1,7]])

class Board

    def initialize
        # if we don't pass anything, we will create a board as before
        @grid = Array.new(8) {Array.new(8, NULL_PIECE)} 
        # if we do pass in other_board, other_board will be nil
        
    end

    # syntactic sugar for :
    # def get_piece_at_pos(pos)
    #     col, row = pos
    #     return @grid[row][col]
    # end
    def [](pos)
        col, row = pos # [col, row] makes the position given by the player
        @grid[row][col] # but this is how the computer will read it
    end

    # syntactic sugar;
    # def set_piece_at_pos(pos, piece)
    #     col, row = pos
    #     @grid[row][col] = piece
    # end
    def []=(pos, piece)
        col, row = pos
        @grid[row][col] = piece 
    end
    
    def place_pieces 
        place_white_row()
        place_black_row()
        place_white_pawns()
        place_black_pawns()
    end

    def in_check?(colour)
        king = pieces_on_the_board.select { |piece| piece.colour == colour && piece.symbol == :K }.first
        moves_of_enemies = []
        kings_enemies = pieces_on_the_board.select {|piece| piece.colour != colour}

        kings_enemies.each do |enemy| 
            # if enemy.symbol == :P 
            #     moves_of_enemies += enemy.available_moves
            #     next
            # end
            moves_of_enemies += enemy.available_moves
        end

        return moves_of_enemies.include?(king.pos)
    end

    def checkmate?(colour)
        pieces = pieces_on_the_board.select {|piece| piece.colour == colour}
        pieces_available_moves = pieces.inject([]) do |acc, piece|
            # if piece.symbol == :K &&
            acc + piece.valid_moves
            # end
            # acc + piece.valid_moves(piece.available_moves) #????? what if we just use piece.available_moves
        end

        if in_check?(colour) && pieces_available_moves.empty? # valid_moves
            return true
        end

        return false
    end

    def duplicate 
        new_board = Board.new()
        pieces = pieces_on_the_board.each do |piece|
            new_piece = piece.class.new(new_board, piece.pos, piece.colour)
        end
        return new_board
        
    end
    
    def is_empty?(pos)
        col, row = pos
        if @grid[row][col] != NULL_PIECE
            return false
        end
        return true
    end

    def pos_on_the_board?(pos)
        col, row = pos
        col.between?(0, 7) && row.between?(0, 7)
       
    end
    
    def pieces_on_the_board 
        result = []
        for row in 0..7 do
            for col in 0..7 do
                # c, r = pos
                piece = self[[col,row]] ##### IS IT BETTER TO PUT GRID HERE?
                if piece != NULL_PIECE
                    result << piece
                end
            end
        end
        result
    end

    def move_piece(start_pos, end_pos)
        s_col, s_row = start_pos
        piece_to_move = @grid[s_row][s_col]

        e_col, e_row = end_pos
        piece_dest = @grid[e_row][e_col]

        if piece_to_move == NULL_PIECE
            raise "Invalid start position"
            #Ask for different start position
        end

        moves = piece_to_move.valid_moves
        if !moves.include?(end_pos)
            raise "Invalid end position"
            #Ask for diferent end position
        end

        piece_to_move.pos = end_pos
        @grid[s_row][s_col] = NULL_PIECE
        @grid[e_row][e_col] = piece_to_move

        return nil
    end

    def move_piece!(start_pos, end_pos)
        s_col, s_row = start_pos
        piece_to_move = @grid[s_row][s_col]

        e_col, e_row = end_pos
        piece_dest = @grid[e_row][e_col]

        piece_to_move.pos = end_pos
        @grid[s_row][s_col] = NULL_PIECE
        @grid[e_row][e_col] = piece_to_move
    end


    def display_border
        lines =  "--|----|----|----|----|----|----|----|----|--"
        puts lines
    end

    def display_separator(num)
        spaces = "#{num} |"
        (0..7).each do |col|
            letter = get_symbol_at_pos([col,num])
            extra_space = letter.length == 2 ? '' : ' '
            spaces += " #{letter} #{extra_space}|"
        end 
        puts spaces
    end

       
    def display_x_axis
        puts "C/R  0    1    2    3    4    5    6    7    "
    end

    def dispay_grid_with_y_axis
        display_x_axis
        display_border
        (0..7).each do |y|
            display_separator(y)
            display_border
        end
    end
    
    


    
    private
    def get_symbol_at_pos(pos)
        col, row = pos
        piece = @grid[row][col]
        return piece == NULL_PIECE ? ' ' : piece.symbol
    end
    

    
    def place_white_row
        Rook.new(self, [0,7], :white)
        Knight.new(self, [1,7], :white)
        Bishop.new(self, [2,7], :white)
        Queen.new(self, [3,7], :white)
        King.new(self, [4,7], :white)
        Bishop.new(self, [5,7], :white)
        Knight.new(self, [6,7], :white)
        Rook.new(self, [7,7], :white)
    end

    def place_black_row
        Rook.new(self, [0,0], :black)
        Knight.new(self, [1,0], :black)
        Bishop.new(self, [2,0], :black)
        Queen.new(self, [3,0], :black)
        King.new(self, [4,0], :black)
        Bishop.new(self, [5,0], :black)
        Knight.new(self, [6,0], :black)
        Rook.new(self, [7,0], :black)
    end

    def place_black_pawns
        Pawn.new(self, [0,6], :white)
        Pawn.new(self, [1,6], :white)
        Pawn.new(self, [2,6], :white)
        Pawn.new(self, [3,6], :white)
        Pawn.new(self, [4,6], :white)
        Pawn.new(self, [5,6], :white)
        Pawn.new(self, [6,6], :white)
        Pawn.new(self, [7,6], :white)
    end

    def place_white_pawns
        Pawn.new(self, [0,1], :black)
        Pawn.new(self, [1,1], :black)
        Pawn.new(self, [2,1], :black)
        Pawn.new(self, [3,1], :black)
        Pawn.new(self, [4,1], :black)
        Pawn.new(self, [5,1], :black)
        Pawn.new(self, [6,1], :black)
        Pawn.new(self, [7,1], :black)
    end

    # def place_null_pieces
    #     NullPiece.new(self,[0,2])
    #     NullPiece.new(self,[0,3])
    #     NullPiece.new(self,[0,4])
    #     NullPiece.new(self,[0,5])
    #     NullPiece.new(self,[1,2])
    #     NullPiece.new(self,[1,3])
    #     NullPiece.new(self,[1,4])
    #     NullPiece.new(self,[1,5])
    #     NullPiece.new(self,[2,2])
    #     NullPiece.new(self,[2,3])
    #     NullPiece.new(self,[2,4])
    #     NullPiece.new(self,[2,5])
    #     NullPiece.new(self,[3,2])
    #     NullPiece.new(self,[3,3])
    #     NullPiece.new(self,[3,4])
    #     NullPiece.new(self,[3,5])
    #     NullPiece.new(self,[4,2])
    #     NullPiece.new(self,[4,3])
    #     NullPiece.new(self,[4,4])
    #     NullPiece.new(self,[4,5])
    #     NullPiece.new(self,[5,2])
    #     NullPiece.new(self,[5,3])
    #     NullPiece.new(self,[5,4])
    #     NullPiece.new(self,[5,5])
    #     NullPiece.new(self,[6,2])
    #     NullPiece.new(self,[6,3])
    #     NullPiece.new(self,[6,4])
    #     NullPiece.new(self,[6,5])
    #     NullPiece.new(self,[7,2])
    #     NullPiece.new(self,[7,3])
    #     NullPiece.new(self,[7,4])
    #     NullPiece.new(self,[7,5])

    # end
    

    
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
end
