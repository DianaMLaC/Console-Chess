require 'rspec'
require 'pieces/king'
require 'board'
require 'pieces/bishop'

describe King do
  let(:a_board) { Board.new }

  describe '#initialize' do
    it 'creates a king' do
      king = King.new(a_board, [4, 7], :white)
      expect(king.pos).to eq([4, 7])
    end
  end

  # it cannot move at start of game
  it 'can move freely if nothing around it' do
    king = King.new(a_board, [4, 4], :white)
    # bishop = Bishop.new(board, [5,5], :black)
    moves = king.available_moves

    expect(moves).to match_array([[3, 3], [3, 4], [3, 5], [4, 3], [4, 5], [5, 3], [5, 4], [5, 5]])
  end

  it 'can move freely if nothing around it - part 2' do
    king = King.new(a_board, [5, 4], :white)

    expect(king.available_moves).to match_array([[4, 3], [4, 4], [4, 5], [5, 3], [5, 5], [6, 3], [6, 4], [6, 5]])
  end

  it 'it can take opposite piece' do
    king = King.new(a_board, [4, 4], :white)
    other_bishop = Bishop.new(a_board, [5, 5], :black)
    moves = king.available_moves

    expect(moves).to match_array([[3, 3], [3, 4], [3, 5], [4, 3], [4, 5], [5, 3], [5, 4], [5, 5]])
  end

  it 'cannot move to square occupied by same colour' do
    king = King.new(a_board, [4, 4], :white)
    bishop = Bishop.new(a_board, [5, 5], :white)
    moves = king.available_moves

    expect(moves).to match_array([[3, 3], [3, 4], [3, 5], [4, 3], [4, 5], [5, 3], [5, 4]])
  end

  # it "checks enemy moves - part 2" do
  #     king = King.new(a_board, [5,4], :white)
  #     pawn = Pawn.new(a_board, [4,4], :black)
  #     pawn = Pawn.new(a_board, [3,5], :black)
  #     pawn = Pawn.new(a_board, [6,5], :black)

  #     expect(king.enemies_moves).to match_array([
  #         [3,4],[3,3],[3,2],[3,1],[3,0],[3,6],[3,7],
  #         [1,7],[2,6],[4,4],[5,3],[6,2],[7,1],
  #         [0,2],[1,3],[2,4],[4,6],[5,7],
  #         [0,5],[1,5],[2,5],[4,5],[5,5],[6,5],[7,5],
  #         [6,4],[5,5],[5,7]
  #     ])
  # end

  it 'does not include in_check moves in the available_positions' do
    king = King.new(a_board, [5, 4], :white)
    queen = Queen.new(a_board, [3, 5], :black)
    bishop = Bishop.new(a_board, [4, 3], :white)

    expect(king.valid_moves).to match_array([[6, 3], [6, 4]])
  end

  it 'does not include in_check moves in the available_positions - part 2' do
    king = King.new(a_board, [4, 4], :white)
    pawn1 = Pawn.new(a_board, [4, 3], :black)
    pawn2 = Pawn.new(a_board, [3, 2], :black)
    pawn3 = Pawn.new(a_board, [6, 2], :black)

    expect(king.valid_moves).to match_array([[3, 3], [3, 5], [4, 5], [5, 5]])
  end

  it 'does not move off the board' do
    king = King.new(a_board, [7, 7], :white)

    expect(king.available_moves).to match_array([[7, 6], [6, 6], [6, 7]])
  end

  # cannot take a piece where the destination pos would result in check
end
