require_relative '../piece.rb'

class Rook < Piece

    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :R)
    end

    # Rook CAN'T step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour
    def available_moves
        available_moves = horizontal_moves + vertical_moves
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

    # def move_dirs
    #     # we have an initial pos of [7,7] and we wanna slide with no one in our way to [7,4]
    #     # 
    # end
end
