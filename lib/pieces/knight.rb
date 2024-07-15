require_relative './piece'

class Knight < Piece
  def initialize(board, start_pos, colour)
    super(board, start_pos, colour, :Kn)
  end

  def available_moves
    knight_available_moves = []
    knight_moves.each do |pos|
      piece_at_pos = @board[pos]
      if piece_at_pos == :NullPiece
        knight_available_moves << pos
        next
      end

      knight_available_moves << pos if piece_at_pos.colour != @colour
    end
    knight_available_moves
  end

  def knight_moves
    knight_total_moves = []
    knight_total_moves << up_left_one
    knight_total_moves << up_left_two
    knight_total_moves << down_left_one
    knight_total_moves << down_left_two
    knight_total_moves << up_right_one
    knight_total_moves << up_right_two
    knight_total_moves << down_right_one
    knight_total_moves << down_right_two

    knight_total_moves.select { |pos| @board.pos_on_the_board?(pos) }
  end

  def up_left_one
    col, row = @pos

    new_row = row - 2
    new_col = col - 1

    [new_col, new_row]
  end

  def up_left_two
    col, row = @pos

    new_row = row - 1
    new_col = col - 2

    [new_col, new_row]
  end

  def down_left_one
    col, row = @pos

    new_row = row + 1
    new_col = col - 2

    [new_col, new_row]
  end

  def down_left_two
    col, row = @pos

    new_row = row + 2
    new_col = col + 1

    [new_col, new_row]
  end

  def up_right_one
    col, row = @pos

    new_row = row - 1
    new_col = col + 2

    [new_col, new_row]
  end

  def up_right_two
    col, row = @pos

    new_row = row - 2
    new_col = col + 1

    [new_col, new_row]
  end

  def down_right_one
    col, row = @pos

    new_row = row + 2
    new_col = col - 1

    [new_col, new_row]
  end

  def down_right_two
    col, row = @pos

    new_row = row + 1
    new_col = col + 2

    [new_col, new_row]
  end
end
