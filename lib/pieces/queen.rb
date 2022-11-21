require_relative '../piece.rb'

class Queen < Piece
    
    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :Q)
    end

    # Queen CAN'T step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour

    def queen_moves
        queen_moves = horizontal_moves + vertical_moves + diagonal_left + diagonal_right
    end

    def move_horizontal # e.g. self.pos [5, 0]
        horizontal_moves = []
        row, col = self.pos
        i = col
        while i < 8 && i >= 0
            horizontal_moves << [row, col + (i * colour_dir)]
            i + (1 * colour_dir)
        end
        return horizontal_moves
    end

    def move_vertical
        vertical_moves = []
        row, col = self.pos
        i = row
        while i < 8 && i >= 0
            vertical_moves << [row + (i * colour_dir), col]
            i + (1 * colour_dir)
        end
        return vertical_moves
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
