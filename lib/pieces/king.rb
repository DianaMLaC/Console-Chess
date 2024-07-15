require_relative './piece'

class King < Piece
  def initialize(board, start_pos, colour)
    super(board, start_pos, colour, '♔')
  end

  def available_moves
    king_available_moves = []

    king_moves.each do |pos|
      piece_at_pos = @board[pos]
      if piece_at_pos == :NullPiece
        king_available_moves << pos
        next
      end

      next if piece_at_pos.colour == @colour

      king_available_moves << pos
    end

    king_available_moves
  end

  def king_moves
    king_total_moves = straight_moves + diagonal_moves
    king_total_moves.select { |pos| @board.pos_on_the_board?(pos) }
  end

  private

  def straight_moves
    col, row = @pos
    king_straight_moves = []
    king_straight_moves << [col, row - 1]
    king_straight_moves << [col, row + 1]

    king_straight_moves << [col - 1, row]
    king_straight_moves << [col + 1, row]

    king_straight_moves
  end

  def diagonal_moves
    col, row = @pos
    king_diagonal_moves = []
    king_diagonal_moves << [col - 1, row - 1]
    king_diagonal_moves << [col + 1, row - 1]

    king_diagonal_moves << [col - 1, row + 1]
    king_diagonal_moves << [col + 1, row + 1]

    king_diagonal_moves
  end
end
