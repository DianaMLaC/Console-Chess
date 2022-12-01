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
        puts "It's your turn #{@colour.to_s}."
        puts "Move on the board using the arrows and press space when selecting a position."

        player_input = @display.cursor.get_input # not sure if this is corect
        # how can we call the cursor class? 
        # we have acces to display (display = Display.new corect?)
        # when we initialize display, one of its instance variables is a new cursor with pos [0,0]
        # can we acces the cursor method throught that instance variable?
        while player_input == nil
            @display.render
            
            puts "It's your turn #{@colour.to_s}."
            puts "Move on the board using the arrows and press space when selecting a position."
            
            player_input = @display.cursor.get_input
            # we want to continue getting input until the player_input returns @cursor_pos (which is space or enter)
        end

        

        return player_input
    end
end
