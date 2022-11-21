require_relative '../piece.rb'

class Bishop < Piece
    def initialize(board, start_pos, colour)
        super(board, start_pos, colour, :B)
    end
    # Bishop CAN'T step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour
    def available_moves
        bishop_available_moves = []
        self.bishop_moves.each do |pos|   
            piece_at_pos = @board[pos]

            if piece_at_pos == :NullPiece
                bishop_available_moves << pos
                next
            end

            if piece_at_pos.colour == self.colour
                next
            end
            bishop_available_moves << pos
        end
        return bishop_available_moves
    end
    
    def bishop_moves
        bishop_moves = diagonal_left + diagonal_right
    end
    
    private
    def diagonal_left # self.pos [7,2]
        diagonal_left = []
        row, col = self.pos
        i = row
        j = col
        while (i < 8 && i >= 0) && (j < 8 && j >= 0)
            i + 1 * colour_dir
            j + 1 * colour_dir
            diagonal_left << [i, j]
        end
        
        return diagonal_left
    end

    def diagonal_right # self.pos [7,2]
        diagonal_right = []
        row, col = self.pos
        i = row
        j = col
        while (i < 8 && i >= 0) && (j < 8 && j >= 0)
            i + 1 * colour_dir
            j - 1 * colour_dir
            diagonal_right << [i, j]
        end
        
        return diagonal_right
    end
end
