require_relative './piece'

class Rook < Piece
  def initialize(board, start_pos, colour)
    symbol = colour == :white ? '♖' : '♜'
    super(board, start_pos, colour, symbol)
  end

  def available_moves
    move_horizontal(-1) + move_horizontal(1) + move_vertical(1) + move_vertical(-1)
  end

  def move_horizontal(dir)
    col, row = @pos
    horizontal_moves = []
    moves_counter = 1 * dir

    new_col = col + moves_counter
    new_pos = [new_col, row]
    while @board.pos_on_the_board?(new_pos)
      new_piece = @board[new_pos]

      if new_piece != :NullPiece
        horizontal_moves << pos if new_piece.colour != @colour
        break
      end
      horizontal_moves << new_pos

      moves_counter += 1 * dir
      new_col = col + moves_counter
      new_pos = [new_col, row]
    end
    horizontal_moves
  end

  def move_vertical(dir)
    col, row = @pos
    vertical_moves = []
    moves_counter = 1 * dir

    new_row = row + moves_counter
    new_pos = [col, new_row]

    while @board.pos_on_the_board?(new_pos)
      new_piece = @board[new_pos]

      if new_piece != :NullPiece
        vertical_moves << new_pos if new_piece.colour != @colour
        break
      end
      vertical_moves << new_pos
      moves_counter += 1 * dir
      new_row = row + moves_counter
      new_pos = [col, new_row]
    end
    vertical_moves
  end
end
