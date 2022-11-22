require_relative '../piece.rb'

class Bishop < Piece
    def initialize(board, start_pos, colour)
        super(board, start_pos, colour, :B)
    end
    
    def available_moves
        bishop_available_moves = []
        self.bishop_moves.each do |pos|   
            piece_at_pos = @board[pos]

            bishop_available_moves << pos
        end
        return bishop_available_moves
    end
    
    def bishop_moves
        bishop_moves = diagonal_left_up + diagonal_right_down + diagonal_left_down + diagonal_right_up 
    end
    
    private
    
    def diagonal_left_up # self.pos [7,2]
        col, row = self.pos
        left_up_moves = []
        up_left = 1
        new_col = col - up_left
        new_row = row - up_left
        new_pos = [new_col, new_row]

        while @board.pos_on_the_board?(new_pos)

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
