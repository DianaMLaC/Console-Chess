require 'rspec'
require 'pieces/pawn'
require 'board'
# require 'pieces/ANOTHERPIECE'

describe Pawn do
  let(:a_board) { Board.new }

  describe 'initialize' do
    it 'creates a Pawn' do
      pawn = Pawn.new(a_board, [0, 6], :white)
      expect(pawn.pos).to eq([0, 6])
    end
  end

  it 'can move two squares from the front row' do
    pawn = Pawn.new(a_board, [1, 6], :white)

    expect(pawn.available_moves).to match_array([[1, 5], [1, 4]])
  end

  it 'cannot move past a piece in its way' do
    pawn = Pawn.new(a_board, [3, 4], :white)
    blocking_pawn = Pawn.new(a_board, [3, 3], :white)

    expect(pawn.available_moves).to match_array([])
  end
  it 'can move only forward' do
    pawn = Pawn.new(a_board, [3, 3], :white)
    opposing_pawn = Pawn.new(a_board, [2, 4], :black)

    expect(pawn.available_moves).to match_array([[3, 2]])
  end
  it 'can take the opposite piece diagonally' do
    pawn = Pawn.new(a_board, [2, 2], :black)
    opposing_pawn = Pawn.new(a_board, [3, 3], :white)

    expect(pawn.available_moves).to match_array([[3, 3], [2, 3]])
  end
  it 'cannot attack opposite coloured piece if right in front' do
    pawn = Pawn.new(a_board, [2, 2], :black)
    opposing_pawn = Pawn.new(a_board, [2, 3], :white)

    expect(pawn.available_moves).to match_array([])
  end

  it 'cannot move off the board' do
    pawn = Pawn.new(a_board, [6, 7], :black)

    expect(pawn.available_moves).to match_array([])
  end
end
