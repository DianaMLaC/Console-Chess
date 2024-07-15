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
    @colour == :white ? -1 : 1
  end

  def valid_moves
    available_moves.reject { |move| move_into_check?(move) }
  end

  def available_moves
    raise 'To be implemented by subclass'
  end

  def move_into_check?(end_pos)
    new_board = @board.duplicate
    new_board.move_piece!(@pos, end_pos)

    new_board.in_check?(@colour)
  end
end
