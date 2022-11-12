require_relative '../piece.rb'

class Knight < Piece

    def initialize(board, start_pos, colour, symbol)
        super(start_pos, colour, :Kn)
    end
end
