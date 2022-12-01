require_relative 'player'
require_relative 'display'
require_relative 'board'
require_relative 'constants'


class Game 
    
    def initialize
        @board = Board.new
        
        @display = Display.new(@board)
        
        @player1 = HumanPlayer.new(:white, @display)
        @player2 = HumanPlayer.new(:black, @display)
        
        @curent_turn = @player1
    end
    
    def play 
        
        @board.place_pieces
   
        while !@board.checkmate?(@curent_turn.colour)
            
            start_pos = @curent_turn.make_move
            piece = @board[start_pos]

            while piece == NULL_PIECE || (piece.colour != @curent_turn.colour)
                start_pos = @curent_turn.make_move
                piece = @board[start_pos]
            end

            end_pos = @curent_turn.make_move

            begin
                @board.move_piece(start_pos, end_pos)
            rescue
                next
            end
            @display.render
            alternate
        end

        puts "Checkmate. Game over"
    end

    def alternate
        if @curent_turn == @player1
            @curent_turn = @player2 
        else 
            @curent_turn = @player1
        end
    end



end
