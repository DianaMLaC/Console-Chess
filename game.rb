class Game 
    attr_accessor :moves_history #can I even put a method to be accesed on different classes?
    def initialize(player, board)
        @player = Player.new
        @board = Board.place_pieces
    end

    def moves_history(Piece, colour, start_pos, end_pos)
        if :R 
            rook_moves = []
            rook_moves.push([Piece, colour, start_pos, end_pos])
            return rook_moves
        end
        if :B 
            bishop_moves = []
            bishop_moves.push([Piece, colour, start_pos, end_pos])
            return bishop_moves
        end
        if :Kn 
            knight_moves = []
            knight_moves.push([Piece, colour, start_pos, end_pos])
            return knight_moves
        end
        if :Q 
            queen_moves = []
            queen_moves.push([Piece, colour, start_pos, end_pos])
            return queen_moves
        end
        if :K
            king_moves = []
            king_moves.push([Piece, colour, start_pos, end_pos])
            return king_moves
        end
        if :P 
            pawn_moves = []
            pawn_moves.push([Piece, colour, start_pos, end_pos])
            return pawn_moves
        end
        
    end
end
