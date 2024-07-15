require_relative './piece'

class Bishop < Piece
  def initialize(board, start_pos, colour)
    super(board, start_pos, colour, :B)
  end

  def available_moves
    diagonal_left_up + diagonal_right_down + diagonal_left_down + diagonal_right_up
  end

  private

  def diagonal_left_up
    col, row = @pos
    left_up_moves = []
    up_left = - 1

    new_col = col + up_left
    new_row = row + up_left
    new_pos = [new_col, new_row]

    while @board.pos_on_the_board?(new_pos)
      new_piece = @board[new_pos]

      if new_piece != :NullPiece
        left_up_moves << new_pos if new_piece.colour != @colour
        break
      end

      left_up_moves << new_pos

      up_left += -1 # - 2
      new_col = col + up_left
      new_row = row + up_left
      new_pos = [new_col, new_row]

    end

    left_up_moves
  end

  def diagonal_left_down
    col, row = @pos
    left_down_moves = []
    down_left = 1

    new_col = col - down_left
    new_row = row + down_left
    new_pos = [new_col, new_row]

    while @board.pos_on_the_board?(new_pos)
      new_piece = @board[new_pos]

      if new_piece != :NullPiece
        left_down_moves << new_pos if new_piece.colour != @colour
        break
      end

      left_down_moves << new_pos

      down_left += 1
      new_col = col - down_left
      new_row = row + down_left
      new_pos = [new_col, new_row]
    end
    left_down_moves
  end

  def diagonal_right_up
    col, row = @pos
    diagonal_up_right = []
    up_right = 1

    new_col = col + up_right
    new_row = row - up_right
    new_pos = [new_col, new_row]

    while @board.pos_on_the_board?(new_pos)
      new_piece = @board[new_pos]

      if new_piece != :NullPiece
        diagonal_up_right << new_pos if new_piece.colour != @colour
        break
      end

      diagonal_up_right << new_pos

      up_right += 1
      new_col = col + up_right
      new_row = row - up_right
      new_pos = [new_col, new_row]
    end
    diagonal_up_right
  end

  def diagonal_right_down
    col, row = @pos
    diagonal_up_down = []
    down_right = 1

    new_col = col + down_right
    new_row = row + down_right
    new_pos = [new_col, new_row]

    while @board.pos_on_the_board?(new_pos)
      new_piece = @board[new_pos]

      if new_piece != :NullPiece
        diagonal_up_down << new_pos if new_piece.colour != @colour
        break
      end

      diagonal_up_down << new_pos
      down_right += 1
      new_col = col + down_right
      new_row = row + down_right
      new_pos = [new_col, new_row]

    end
    diagonal_up_down
  end
end
