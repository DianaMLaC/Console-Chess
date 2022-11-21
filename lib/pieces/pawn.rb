require_relative '../piece.rb'

class Pawn < Piece
    attr_reader :start_row, 

    def initialize(board, start_pos, colour, symbol)
        @board = board
        @start_row = true
        super(board, start_pos, colour, :P)
    end

    # Pawn CAN'T step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour
    
    def available_moves
        available_moves = []
        self.pawn_moves.each do |position|   
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

    private
    
    def pawn_moves
        pawn_moves = forward_moves + side_attacks
    end
    

    # we also need to check if the possition is not out of the board 
    # same as valid or ocuppied by opposite colour
    # but we leave this here for now, as the pawn is different from other pieces in attack way ... TBC

    def forward_moves # only if those pos is empty
        if @board.is_empty?(self.pos) && @board.pos_valid?(self.pos)
            forward_moves = []
            row, col = self.pos #position at which the piece is on the board
            
            if at_start_row?
                forward_moves << [row + colour_dir, col] 
                forward_moves << [row + (2 * colour_dir), col]
                @start_row = false
    
                return forward_moves
            end
    
            new_row = row + colour_dir
            new_pos = [new_row, col]
            forward_moves << new_pos
            
            return forward_moves

        end
    end

    def side_attacks
         if @board.pos_valid(self.pos) #only if possition is ocupied by opposite colour

            pos_attack = []
            row, col = self.pos
    
            if self.colour == :white
                new_row = row + 1
                new_col = col - 1
                new_pos1 = [new_row, new_col]
                
                if @board[new_pos1].color == :black
                    pos_attack << new_pos1
                end
                
                new_col = col + 1
                new_pos2 = [new_row, new_col]
                
                if @board[new_pos2].color == :black
                    pos_attack << new_pos2
                end
                
            end
            
            if self.colour == :black
                new_row1 = row + 1
                new_col1 = col - 1
                new_pos1 = [new_row1, new_col1]
                
                if @board[new_pos1].color == :white
                    pos_attack << new_pos1
                end
                
                new_col2 = col + 1
                new_pos2 = [new_row1, new_col2]
                
                if @board[new_pos2].color == :white
                    pos_attack << new_pos2
                end
            end
            return pos_attack
         end
    end
    
    private

    def at_start_row?
        @start_row
    end



end


  