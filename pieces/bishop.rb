require_relative '../piece.rb'

class Bishop < Piece

    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :B)
    end
    # Bishop CAN'T step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour
    def available_moves
        available_moves = diagonal_left + diagonal_rigth
    end

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

    def diagonal_rigth # self.pos [7,2]
        diagonal_rigth = []
        row, col = self.pos
        i = row
        j = col
        while (i < 8 && i >= 0) && (j < 8 && j >= 0)
            i + 1 * colour_dir
            j - 1 * colour_dir
            diagonal_rigth << [i, j]
        end
        
        return diagonal_rigth
    end
end
