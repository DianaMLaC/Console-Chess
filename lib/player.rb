require_relative 'display'

class Player
    attr_reader :colour
    def initialize(colour, display)
        @colour = colour
        @display = display
    end
end

class HumanPlayer < Player
    def initialize(colour, display)
        super(colour, display)
    end

    def make_move
        @display.render
        if @colour == :white
            player_colour = "yellow"
        else  
            player_colour = "purple"
        end
        puts "It's your turn #{player_colour}."
        puts "Move on the board using the arrows and press space when selecting a position."

        player_input = @display.cursor.get_input 
        
        while player_input == nil
            @display.render
            
            puts "It's your turn #{player_colour}."
            puts "Move on the board using the arrows and press space when selecting a position."
            
            player_input = @display.cursor.get_input
            # we want to continue getting input until the player_input returns @cursor_pos (which is space or enter)
        end

        

        return player_input
    end
end
