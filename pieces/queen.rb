require_relative '../piece.rb'

class Queen < Piece
    
    def initialize(start_pos, colour)
        super(start_pos, colour, :Q)
    end
end
