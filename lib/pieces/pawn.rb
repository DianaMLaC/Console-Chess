require_relative './piece'

class Pawn < Piece
  def initialize(board, start_pos, colour)
    super(board, start_pos, colour, :P)
  end

  def available_moves
    pawn_available_moves = []
    pawn_moves.each do |pos|
      piece_at_pos = @board[pos]

      if piece_at_pos == :NullPiece
        pawn_available_moves << pos
        next
      end
    end

    diagonal_attacks.each do |pos|
      piece_at_pos = @board[pos]

      next unless piece_at_pos != :NullPiece

      pawn_available_moves << pos if piece_at_pos.colour != @colour
    end
    pawn_available_moves
  end

  def pawn_moves
    pawn_moves = at_start_row + forward_moves
    pawn_moves.select { |pos| @board.pos_on_the_board?(pos) }
  end

  def diagonal_attacks
    col, row = @pos
    pawn_attacks = []

    if @colour == :white
      pawn_attacks << [col - 1, row - 1]
      pawn_attacks << [col + 1, row - 1]
    end

    if @colour == :black
      pawn_attacks << [col - 1, row + 1]
      pawn_attacks << [col + 1, row + 1]
    end
    pawn_attacks.select { |pos| @board.pos_on_the_board?(pos) }
  end

  def start_row?
    col, row = @pos
    return true if (@colour == :white) && (row == 6)

    return true if (@colour == :black) && (row == 1)

    false
  end

  private

  def at_start_row
    col, row = @pos
    start_row_moves = []

    start_row_moves << [col, row - 2] if start_row? && @colour == :white

    start_row_moves << [col, row + 2] if start_row? && @colour == :black

    start_row_moves
  end

  def forward_moves
    col, row = @pos
    pawn_forward_moves = []
    pawn_forward_moves << [col, row - 1] if @colour == :white

    pawn_forward_moves << [col, row + 1] if @colour == :black

    pawn_forward_moves
  end
end
