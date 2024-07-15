require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'constants'

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8, NULL_PIECE) }
  end

  def [](pos)
    col, row = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    col, row = pos
    @grid[row][col] = piece
  end

  def place_pieces
    place_white_row
    place_black_row
    place_white_pawns
    place_black_pawns
  end

  def in_check?(colour)
    king = pieces_on_the_board.select { |piece| piece.colour == colour && piece.symbol == :K }.first
    moves_of_enemies = []
    kings_enemies = pieces_on_the_board.reject { |piece| piece.colour == colour }

    kings_enemies.each do |enemy|
      moves_of_enemies += enemy.available_moves
    end

    moves_of_enemies.include?(king.pos)
  end

  def checkmate?(colour)
    pieces = pieces_on_the_board.select { |piece| piece.colour == colour }
    pieces_available_moves = pieces.inject([]) do |acc, piece|
      acc + piece.valid_moves
    end

    return true if in_check?(colour) && pieces_available_moves.empty? # valid_moves

    false
  end

  def duplicate
    new_board = Board.new
    pieces_on_the_board.each do |piece|
      piece.class.new(new_board, piece.pos, piece.colour)
    end
    new_board
  end

  def is_empty?(pos)
    col, row = pos
    return false if @grid[row][col] != NULL_PIECE

    true
  end

  def pos_on_the_board?(pos)
    col, row = pos
    col.between?(0, 7) && row.between?(0, 7)
  end

  def pieces_on_the_board
    result = []
    (0..7).each do |row|
      (0..7).each do |col|
        piece = self[[col, row]]
        result << piece if piece != NULL_PIECE
      end
    end
    result
  end

  def move_piece(start_pos, end_pos)
    s_col, s_row = start_pos
    piece_to_move = @grid[s_row][s_col]
    e_col, e_row = end_pos

    raise 'Invalid start position' if piece_to_move == NULL_PIECE

    moves = piece_to_move.valid_moves
    raise 'Invalid end position' unless moves.include?(end_pos)

    piece_to_move.pos = end_pos
    @grid[s_row][s_col] = NULL_PIECE
    @grid[e_row][e_col] = piece_to_move

    nil
  end

  def move_piece!(start_pos, end_pos)
    s_col, s_row = start_pos
    piece_to_move = @grid[s_row][s_col]
    e_col, e_row = end_pos

    piece_to_move.pos = end_pos
    @grid[s_row][s_col] = NULL_PIECE
    @grid[e_row][e_col] = piece_to_move
  end

  private

  def get_symbol_at_pos(pos)
    col, row = pos
    piece = @grid[row][col]
    piece == NULL_PIECE ? ' ' : piece.symbol
  end

  def place_white_row
    Rook.new(self, [0, 7], :white)
    Knight.new(self, [1, 7], :white)
    Bishop.new(self, [2, 7], :white)
    Queen.new(self, [3, 7], :white)
    King.new(self, [4, 7], :white)
    Bishop.new(self, [5, 7], :white)
    Knight.new(self, [6, 7], :white)
    Rook.new(self, [7, 7], :white)
  end

  def place_black_row
    Rook.new(self, [0, 0], :black)
    Knight.new(self, [1, 0], :black)
    Bishop.new(self, [2, 0], :black)
    Queen.new(self, [3, 0], :black)
    King.new(self, [4, 0], :black)
    Bishop.new(self, [5, 0], :black)
    Knight.new(self, [6, 0], :black)
    Rook.new(self, [7, 0], :black)
  end

  def place_black_pawns
    Pawn.new(self, [0, 6], :white)
    Pawn.new(self, [1, 6], :white)
    Pawn.new(self, [2, 6], :white)
    Pawn.new(self, [3, 6], :white)
    Pawn.new(self, [4, 6], :white)
    Pawn.new(self, [5, 6], :white)
    Pawn.new(self, [6, 6], :white)
    Pawn.new(self, [7, 6], :white)
  end

  def place_white_pawns
    Pawn.new(self, [0, 1], :black)
    Pawn.new(self, [1, 1], :black)
    Pawn.new(self, [2, 1], :black)
    Pawn.new(self, [3, 1], :black)
    Pawn.new(self, [4, 1], :black)
    Pawn.new(self, [5, 1], :black)
    Pawn.new(self, [6, 1], :black)
    Pawn.new(self, [7, 1], :black)
  end
end
