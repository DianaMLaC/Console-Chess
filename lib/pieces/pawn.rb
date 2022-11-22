require_relative '../piece.rb'

class Pawn < Piece
    # attr_reader :start_row 

    def initialize(board, start_pos, colour)
        # @start_row = true
        super(board, start_pos, colour, :P)
    end

    # Pawn CAN'T step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour
    
    def available_moves
        pawn_available_moves = []
        self.pawn_moves.each do |pos|   
            piece_at_pos = @board[pos]
           
            if piece_at_pos == :NullPiece
                pawn_available_moves << pos
                next
            end#HOW CAN WE CHECK AGAINST diagonal_ATTACKS? 
        end

        self.diagonal_attacks.each do |pos|
            piece_at_pos = @board[pos]

            if piece_at_pos != :NullPiece 
                if piece_at_pos.colour != self.colour
                    pawn_available_moves << pos
                end
            end
        end
        return pawn_available_moves
    end

    
    def pawn_moves
        pawn_moves = at_start_row + forward_moves # + diagonal_attacks
    end

    def diagonal_attacks
        col, row = self.pos
        pawn_attacks = []

        if self.colour == :white
            pawn_attacks << [col - 1, row - 1]
            pawn_attacks << [col + 1, row - 1]
        end

        if self.colour == :black
            pawn_attacks << [col - 1, row + 1]
            pawn_attacks << [col + 1, row + 1]
        end
        return pawn_attacks
         
    end

    def start_row?
        col, row = self.pos
        if (self.colour == :white) && (row == 6)
            return true
        end

        if (self.colour == :black) && (row == 1)
            return true
        end
        return false
    end
    
    private

    def at_start_row
        col, row = self.pos
        start_row_moves = []

        if self.start_row? && self.colour == :white
            start_row_moves << [col, row - 2]
        end

        if self.start_row? && self.colour == :black
            start_row_moves << [col, row + 2]
        end

        return start_row_moves
    end

    def forward_moves # only if those pos is empty
        col, row = self.pos
        pawn_forward_moves = []
        if self.colour == :white
            pawn_forward_moves << [col, row - 1]
        end

        if self.colour == :black
            pawn_forward_moves << [col, row + 1]
        end

        return pawn_forward_moves        
    end
end


  