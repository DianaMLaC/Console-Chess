require_relative '../piece.rb'

def sum(b, c)
    return b + c
end

puts sum(5,6)

class King < Piece
    def initialize(board, start_pos, colour)
        super(board, start_pos, colour, :K)  
    end

    # King CAN'T move in chess
    # available moves need to be checked if empty, valid, or opposite colour
    def available_moves
        king_available_moves = []
        self.king_moves.each do |pos|
            piece_at_pos = @board[pos]

            if piece_at_pos == :NullPiece
                king_available_moves << pos
                next
            end

            if piece_at_pos.colour == self.colour
                next
            end

            # TODO: test to see if pos would result in check

            king_available_moves << pos

        end
        return king_available_moves
        # another_position = [5,4]
        # @board.is_empty?(another_position)
        # piece_at_another_position = @board[another_position]
        # piece_at_another_position.colour != self.colour

    end


    def king_moves
        return straight_moves + diagonal_moves
    end

    private

    def straight_moves
        col, row = self.pos
        king_straight_moves = []
        king_straight_moves << [row, col - 1] #horizontal_left
        king_straight_moves << [row, col + 1] #horizontal_right

        king_straight_moves << [row - 1, col] #vertical_up
        king_straight_moves << [row + 1, col] #vertical_down

        return king_straight_moves
    end

    def diagonal_moves
        col, row = self.pos
        king_diagonal_moves = []
        king_diagonal_moves << [row - 1, col - 1] #diagonal_left_up
        king_diagonal_moves << [row + 1, col - 1] #diagonal_left_up

        king_diagonal_moves << [row - 1, col + 1] #diagonal_right_up
        king_diagonal_moves << [row + 1, col + 1] #diagonal_right_down

        return king_diagonal_moves
    end
 
end
