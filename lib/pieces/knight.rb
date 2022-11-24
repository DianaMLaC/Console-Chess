require_relative './piece.rb'

class Knight < Piece

    def initialize(board, start_pos, colour)
        super(board, start_pos, colour, :Kn)
    end

    # KNIGHT can step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour
    
    def available_moves
        available_moves = []
        self.knight_moves.each do |pos|   
            piece_at_pos = @board[pos]
            if piece_at_pos == :NullPiece
                available_moves << pos
                next
            end

            if piece_at_pos.colour != self.colour
                available_moves << pos
            end

            

          
        end
        return available_moves
    end
    
    def knight_moves
        knight_total_moves = []
        knight_total_moves << up_left_one 
        knight_total_moves << up_left_two 
        knight_total_moves << down_left_one 
        knight_total_moves << down_left_two
        knight_total_moves << up_right_one 
        knight_total_moves << up_right_two
        knight_total_moves << down_right_one 
        knight_total_moves << down_right_two
        return knight_total_moves
    end

    def up_left_one
        col, row = self.pos

        new_row = row - 2
        new_col = col - 1
        up_left_one_move = [new_col, new_row]  
    end

    def up_left_two
        col, row = self.pos
        
        new_row = row - 1
        new_col = col - 2
        
        up_left_two_move = [new_col, new_row]  

    end

    def down_left_one
        col, row = self.pos

        new_row = row + 1
        new_col = col - 2
        
        down_left_one_move = [new_col, new_row] 

    end

    def down_left_two
        col, row = self.pos
        
        new_row = row + 2
        new_col = col + 1
        
        down_left_two_move = [new_col, new_row] 

    end

    def up_right_one
        col, row = self.pos

        new_row = row - 1
        new_col = col + 2
        
        up_right_one_move = [new_col, new_row] 

    end

    def up_right_two
        col, row = self.pos
        
        new_row = row - 2
        new_col = col + 1
        
        up_right_two_move = [new_col, new_row] 
    end

    def down_right_one
        col, row = self.pos

        new_row = row + 2
        new_col = col - 1
        
        down_right_one_move = [new_col, new_row] 
    end

    def down_right_two
        col, row = self.pos
        
        new_row = row + 1
        new_col = col + 2
        
        down_right_two_move = [new_col, new_row] 
    end

end
