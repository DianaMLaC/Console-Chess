require_relative '../piece.rb'

class Bishop < Piece

    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :B)
    end
end
