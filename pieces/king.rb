require_relative '../piece.rb'

class King < Piece
    
    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :K)
    end

    def king_moves
        king_moves = straight_moves + diagonal_moves
    end

    def straight_moves
        row, col = self.pos
        
        straight_moves << [row, col - 1] #horizontal_left
        straight_moves << [row, col + 1] #horizontal_right

        straight_moves << [row - 1, col] #vertical_up
        straight_moves << [row + 1, col] #vertical_down

        return straight_moves
    end

    def diagonal_moves
        row, col = self.pos

        diagonal_moves << [row - 1, col - 1] #diagonal_left_up
        diagonal_moves << [row + 1, col - 1] #diagonal_left_up

        diagonal_moves << [row - 1, col + 1] #diagonal_right_up
        diagonal_moves << [row + 1, col + 1] #diagonal_right_down

        return diagonal_moves
    end
 
end
