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
    player_colour = @colour == :white ? 'yellow' : 'purple'
    check_message = @display.board.in_check?(@colour) ? ', but your king is in check' : ''

    puts "It's your turn #{player_colour}#{check_message}."
    puts 'Move on the board using the arrows and press space when selecting a position.'
    puts 'When selecting a piece with valid moves it will highlight as purple and its possible moves with green'

    player_input = @display.cursor.get_input

    while player_input.nil?
      @display.render
      check_message = @display.board.in_check?(@colour) ? ', but your king is in check' : ''
      puts "It's your turn #{player_colour}#{check_message}."
      puts 'Move on the board using the arrows and press space when selecting a position.'
      puts 'When selecting a piece with valid moves it will highlight as purple and its possible moves with green'

      player_input = @display.cursor.get_input
    end

    player_input
  end
end
