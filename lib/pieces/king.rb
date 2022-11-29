require_relative './piece.rb'

class King < Piece
    
    def initialize(board, start_pos, colour)
        super(board, start_pos, colour, :K)  
    end

    # King CAN'T move in chess
    # available moves need to be checked if empty, valid, or opposite colour
    def available_moves
        king_available_moves = []

        king_moves.each do |pos|
            if enemies_moves.include?(pos)
                next
            end

            piece_at_pos = @board[pos]
            if piece_at_pos == :NullPiece
                king_available_moves << pos
                next
            end

            if piece_at_pos.colour == @colour 
                next
            end

            king_available_moves << pos
        end

        return king_available_moves
    end


    def king_moves
        knight_total_moves = straight_moves + diagonal_moves
        return knight_total_moves.select { |pos| @board.pos_on_the_board?(pos)}
    end


    def enemies_moves
        all_pieces = @board.pieces_on_the_board
        kings_enemies = all_pieces.select {|piece| piece.colour != @colour}

        moves_of_enemies = []

        kings_enemies.each do |enemy|
            if enemy.symbol == :P
                moves_of_enemies += enemy.diagonal_attacks
                next
            end

            moves_of_enemies += enemy.available_moves
        end

        return moves_of_enemies
    end

    private

    def straight_moves
        col, row = self.pos
        king_straight_moves = []
        king_straight_moves << [col, row - 1] #horizontal_left
        king_straight_moves << [col, row + 1] #horizontal_right

        king_straight_moves << [col - 1, row] #vertical_up
        king_straight_moves << [col + 1, row] #vertical_down

        return king_straight_moves
    end

    def diagonal_moves
        col, row = self.pos
        king_diagonal_moves = []
        king_diagonal_moves << [col - 1, row - 1] #diagonal_left_up
        king_diagonal_moves << [col + 1, row - 1] #diagonal_left_up

        king_diagonal_moves << [col - 1, row + 1] #diagonal_right_up
        king_diagonal_moves << [col + 1, row + 1] #diagonal_right_down

        return king_diagonal_moves
    end
 
end
