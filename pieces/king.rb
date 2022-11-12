require_relative '../piece.rb'

class King < Piece
    
    def initialize(start_pos, colour)
        super(start_pos, colour, :K)
    end
end
