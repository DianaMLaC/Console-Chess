require_relative '../piece.rb'

class Bishop < Piece

    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :B)
    end

    def available_moves
        available_moves = diagonal_left + diagonal_rigth
    end

    def diagonal_left # self.pos [7,2]
        diagonal_left = []
        row, col = self.pos
        i = row
        j = col
        while (i < 8 && i >= 0) && (j < 8 && j >= 0)
            diagonal_left << [i, j]
            i * colour_dir
        end
        
        return diagonal_left
    end
end
