require_relative '../piece.rb'

class Rook < Piece

    def initialize(start_pos, colour)
        super(start_pos, colour, :R)
    end

    # def move_dirs
    #     # we have an initial pos of [7,7] and we wanna slide with no one in our way to [7,4]
    #     # 
    # end
end
