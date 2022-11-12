require_relative '../piece.rb'

class Knight < Piece

    def initialize(start_pos, colour)
        super(start_pos, colour, :Kn)
    end
end
