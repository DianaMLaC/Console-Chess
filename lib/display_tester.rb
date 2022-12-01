# require_relative 'display'
# require_relative 'board'

# a_board = Board.new
# a_board.place_pieces()

# a_display = Display.new(a_board)

# while true
#     a_display.render()
#     a_display.cursor.get_input()
# end
require_relative 'game'

g = Game.new
g.play()
