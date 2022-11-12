require_relative '../piece.rb'

class King < Piece
    
    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :K)
    end
end
