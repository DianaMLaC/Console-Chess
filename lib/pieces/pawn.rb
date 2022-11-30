require_relative './piece.rb'

class Pawn < Piece

    def initialize(board, start_pos, colour)
        # @start_row = true
        super(board, start_pos, colour, :P)
    end

    # Pawn CAN'T step over other pieces
    # available moves need to be checked if empty, valid, or opposite colour
    
    def available_moves
        pawn_available_moves = []
        pawn_moves.each do |pos|   
            piece_at_pos = @board[pos]
           
            if piece_at_pos == :NullPiece
                pawn_available_moves << pos
                next
            end#HOW CAN WE CHECK AGAINST diagonal_ATTACKS? 
        end

        diagonal_attacks.each do |pos|
            piece_at_pos = @board[pos]

            if piece_at_pos != :NullPiece 
                if piece_at_pos.colour != @colour
                    pawn_available_moves << pos
                end
            end
        end
        return pawn_available_moves
    end

    
    def pawn_moves
        pawn_moves = at_start_row + forward_moves # + diagonal_attacks
        pawn_moves.select { |pos| @board.pos_on_the_board?(pos)}
    end

    def diagonal_attacks
        col, row = @pos
        pawn_attacks = []

        if @colour == :white
            pawn_attacks << [col - 1, row - 1]
            pawn_attacks << [col + 1, row - 1]
        end

        if @colour == :black
            pawn_attacks << [col - 1, row + 1]
            pawn_attacks << [col + 1, row + 1]
        end
        return pawn_attacks.select { |pos| @board.pos_on_the_board?(pos)}
         
    end

    def start_row?
        col, row = @pos
        if (@colour == :white) && (row == 6)
            return true
        end

        if (@colour == :black) && (row == 1)
            return true
        end
        return false
    end
    
    private

    def at_start_row
        col, row = @pos
        start_row_moves = []

        if start_row? && @colour == :white
            start_row_moves << [col, row - 2]
        end

        if start_row? && @colour == :black
            start_row_moves << [col, row + 2]
        end

        return start_row_moves
    end

    def forward_moves # only if those pos is empty
        col, row = @pos
        pawn_forward_moves = []
        if @colour == :white
            pawn_forward_moves << [col, row - 1]
        end

        if @colour == :black
            pawn_forward_moves << [col, row + 1]
        end

        return pawn_forward_moves        
    end
end


  