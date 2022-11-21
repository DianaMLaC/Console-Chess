require 'rspec'
require 'pieces/king'
require 'board'
require 'pieces/bishop'

describe King do
    let(:a_board) { Board.new()}

    describe "#initialize" do
        it "creates a king" do
            king = King.new(a_board, [4,7], :white)
            expect(king.pos).to eq([4,7])
        end
    end

    # it cannot move at start of game
    it "can move freely if nothing around it" do
        king = King.new(a_board, [4,4], :white)
        # bishop = Bishop.new(board, [5,5], :black)
        moves = king.available_moves

        expect(moves).to match_array([[3,3],[3,4],[3,5],[4,3],[4,5],[5,3],[5,4],[5,5]])
    end

    it "it can take opposite piece" do
        king = King.new(a_board, [4,4], :white)
        other_bishop = Bishop.new(a_board, [5,5], :black)
        moves = king.available_moves

        expect(moves).to match_array([[3,3],[3,4],[3,5],[4,3],[4,5],[5,3],[5,4],[5,5]])
    end

    it "cannot move to square occupied by same colour" do
        king = King.new(a_board, [4,4], :white)
        bishop = Bishop.new(a_board, [5,5], :white)
        moves = king.available_moves

        expect(moves).to match_array([[3,3],[3,4],[3,5],[4,3],[4,5],[5,3],[5,4]])
    
    end
    # cannot take a piece where the destination pos would result in check
end
