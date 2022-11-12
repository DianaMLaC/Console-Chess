require_relative '../piece.rb'

class Queen < Piece
    
    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :Q)
    end
end
