require_relative './piece.rb'

class Rook < Piece

    def initialize(board, start_pos, colour)
        super(board,start_pos, colour, :R)
    end


    def available_moves
        move_horizontal(-1) + move_horizontal(1) + move_vertical(1) + move_vertical(-1)
    end

    def move_horizontal(dir)
        col, row = self.pos
        horizontal_moves = []
        moves_counter = 1 * dir

        new_col = col + moves_counter
        new_pos = [new_col, row]
        while @board.pos_on_the_board?(new_pos)
            new_piece = @board[new_pos]

            if new_piece != :NullPiece
                if new_piece.colour != self.colour
                    horizontal_moves << pos
                end
                break
            end
            horizontal_moves << new_pos
            
            moves_counter += 1 * dir
            new_col = col + moves_counter
            new_pos = [new_col, row]
        end
        return horizontal_moves

    end


    def move_vertical(dir)
        col, row = @pos
        vertical_moves = []
        moves_counter = 1 * dir

        new_row = row + moves_counter
        new_pos = [col, new_row]

        while @board.pos_on_the_board?(new_pos)
            new_piece = @board[new_pos]

            if new_piece != :NullPiece
                if new_piece.colour != self.colour
                    vertical_moves << new_pos
                end
                break
            end
            vertical_moves << new_pos
            moves_counter += 1 * dir
            new_row = row + moves_counter 
            new_pos = [col, new_row]
        end
        return vertical_moves
    end


end
