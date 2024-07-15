require_relative './piece'

class Queen < Piece
  def initialize(board, start_pos, colour)
    super(board, start_pos, colour, '♕')
  end

  def available_moves
    diagonal_left_up + diagonal_right_down + diagonal_left_down + diagonal_right_up + move_horizontal(-1) + move_horizontal(1) + move_vertical(1) + move_vertical(-1)
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
        horizontal_moves << new_pos if new_piece.colour != @colour
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

      up_left += -1
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
