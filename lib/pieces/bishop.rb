require_relative './piece.rb'

class Bishop < Piece

    def initialize(board, start_pos, colour)
        super(board, start_pos, colour, :B)
    end
    
    
    def available_moves
        return diagonal_left_up + diagonal_right_down + diagonal_left_down + diagonal_right_up 
    end

    
    private
    
    def diagonal_left_up # @pos [7,2]
        col, row = @pos
        left_up_moves = []
        up_left = - 1

        new_col = col + up_left # 
        new_row = row + up_left
        new_pos = [new_col, new_row] # [6, 1]

        while @board.pos_on_the_board?(new_pos)
            new_piece = @board[new_pos]

            if new_piece != :NullPiece
                if new_piece.colour != @colour
                    left_up_moves << new_pos
                end
                break
            end

            left_up_moves << new_pos

            up_left += -1 # - 2
            new_col = col + up_left
            new_row = row + up_left
            new_pos = [new_col, new_row] # [5,0]


        end
        
        return left_up_moves
    end

    def diagonal_left_down
        col, row = @pos
        left_down_moves = []
        down_left = 1

        new_col = col - down_left
        new_row = row + down_left
        new_pos = [new_col, new_row]

        while @board.pos_on_the_board?(new_pos)
            new_piece = @board[new_pos]

            if new_piece != :NullPiece
                if new_piece.colour != @colour
                    left_down_moves << new_pos
                end
                break
            end

            left_down_moves << new_pos

            down_left += 1
            new_col = col - down_left
            new_row = row + down_left
            new_pos = [new_col, new_row]
        end
        return left_down_moves
    end

    def diagonal_right_up  # @pos [7,2]
        col, row = @pos
        diagonal_up_right = []
        up_right = 1

        new_col = col + up_right
        new_row = row - up_right
        new_pos = [new_col, new_row]

        while @board.pos_on_the_board?(new_pos)
            new_piece = @board[new_pos]

            if new_piece != :NullPiece
                if new_piece.colour != @colour
                    diagonal_up_right << new_pos
                end
                break
            end

            diagonal_up_right << new_pos

            up_right += 1
            new_col = col + up_right
            new_row = row - up_right
            new_pos = [new_col, new_row]
        end
        return diagonal_up_right
    end

    def diagonal_right_down
        col, row = @pos
        diagonal_up_down = []
        down_right = 1

        new_col = col + down_right
        new_row = row + down_right
        new_pos = [new_col, new_row]

        while @board.pos_on_the_board?(new_pos)
            new_piece = @board[new_pos]

            if new_piece != :NullPiece
                if new_piece.colour != @colour
                    diagonal_up_down << new_pos
                end
                break
            end

            diagonal_up_down << new_pos
            down_right += 1
            new_col = col + down_right
            new_row = row + down_right
            new_pos = [new_col, new_row]
        
        end
        return diagonal_up_down
    end
end
