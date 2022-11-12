require_relative '../piece.rb'

class Bishop < Piece

    def initialize(start_pos, colour)
        super(start_pos, colour, :B)
    end
end
