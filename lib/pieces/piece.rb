

class Piece
    attr_reader :colour, :symbol
    attr_accessor :pos

    def initialize(board, start_pos, colour, symbol)
        @symbol = symbol
        @colour = colour 
        @board = board
        @pos = start_pos

        @board[start_pos] = self
    end

    def colour_dir
        self.colour == :white ? -1 : 1 
    end

    def valid_moves(moves)
        result = []
        moves.each do |move|
            if !move_into_check?(move)
                result << move
            end
        end
        result
        # return moves.select {|move| !move_into_check?(move)}
        
        #filters out the moves of a piece that will leave the player in check

    end

    def move_into_check?(end_pos)
        #1 duplicate the board on which to perform the move
        new_board = @board.duplicate()
        new_board.move_piece(@pos, end_pos)
        
        #2 on the duplicated board use the method in_check to see if the player is in check
        new_board.in_check?(@colour)
        #returns true if the end_pos will move our player into check
    end
    
end
