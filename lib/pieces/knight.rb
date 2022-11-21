require_relative '../piece.rb'

class Knight < Piece

    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :Kn)
    end

    # KNIGHT can step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour
    
    def available_moves
        available_moves = []
        self.knight_moves.each do |position|   
            if @board.pos_valid?(position)
                if @board.is_empty?(position)
                    available_moves << position 
                end

                if self.valid_attack(position)
                    available_moves << position
                end 
            end
        end
        return available_moves
    end
    
    def knight_moves
        knight_moves = []
        knight_moves << up_left_one 
        knight_moves << up_left_two 
        knight_moves << down_left_one 
        knight_moves << down_left_two
        knight_moves << up_right_one 
        knight_moves << up up_right_two
        knight_moves << down_right_one 
        knight_moves << down_right_two
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

    def up_right_one
        row, col = self.pos

        new_row = row - 1
        new_col = col + 2
        
        up_right_one_move = [new_row, new_col]

    end

    def up_right_two
        row, col = self.pos
        
        new_row = row - 2
        new_col = col + 1
        
        up_right_two_move = [new_row, new_col]
    end

    def down_right_one
        row, col = self.pos

        new_row = row + 2
        new_col = col + 1
        
        down_right_one = [new_row, new_col]
    end

    def down_right_two
        row, col = self.pos
        
        new_row = row + 1
        new_col = col + 2
        
        down_right_two_move = [new_row, new_col]
    end
end
