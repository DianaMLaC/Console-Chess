require_relative '../piece.rb'

class Knight < Piece

    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :Kn)
    end

    # KNIGHT can step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour
    def available_moves
        available_moves = []
        available_moves << up_left_one 
        available_moves << up_left_two 
        available_moves << down_left_one 
        available_moves << down_left_two
        available_moves << up_rigth_one 
        available_moves << up up_rigth_two
        available_moves << down_rigth_one 
        available_moves << down_rigth_two
    end

    def up_left_one
        row, col = self.pos

        new_row = row - 2
        new_col = col - 1
        up_left_one_move = [new_row, new_col]  
    end

    def up_left_two
        row, col = self.pos
        
        new_row = row - 1
        new_col = col - 2
        
        up_left_two_move = [new_row, new_col] 

    end

    def down_left_one
        row, col = self.pos

        new_row = row + 1
        new_col = col - 2
        
        down_left_one_move = [new_row, new_col]

    end

    def down_left_two
        row, col = self.pos
        
        new_row = row + 2
        new_col = col + 1
        
        down_left_two_move = [new_row, new_col]

    end

    def up_rigth_one
        row, col = self.pos

        new_row = row - 1
        new_col = col + 2
        
        up_rigth_one_move = [new_row, new_col]

    end

    def up_rigth_two
        row, col = self.pos
        
        new_row = row - 2
        new_col = col + 1
        
        up_rigth_two_move = [new_row, new_col]
    end

    def down_rigth_one
        row, col = self.pos

        new_row = row + 2
        new_col = col + 1
        
        down_rigth_one = [new_row, new_col]
    end

    def down_rigth_two
        row, col = self.pos
        
        new_row = row + 1
        new_col = col + 2
        
        down_rigth_two_move = [new_row, new_col]
    end
end
