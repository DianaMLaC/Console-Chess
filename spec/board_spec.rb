require 'rspec'
require 'board'
require 'pieces/bishop'
require 'pieces/king'
require 'pieces/knight'
require 'pieces/pawn'
require 'pieces/queen'
require 'pieces/rook'

describe Board do
    let(:a_board) {Board.new}

    describe "initialize" do
        it "creates a board" do
        a_board = Board.new()

        # expect(a_board).to match(Array.new(8) {Array.new(8, :NullPiece)})
        end
    end

    it "checks if a position is empty" do 
        queen = Queen.new(a_board, [5,4], :while)

        expect(a_board.is_empty?([5,4])).to eq(false)
        expect(a_board.is_empty?([3,4])).to eq(true)

    end

    it "checks if a position is on the board" do 
        # let(:a_board) {Board.new}
        expect(a_board.pos_on_the_board?([5,4])).to eq(true)
        expect(a_board.pos_on_the_board?([8,3])).to eq(false)
        expect(a_board.pos_on_the_board?([3,9])).to eq(false)
    end

    it "moves the piece" do
        king = King.new(a_board, [4,2], :white)
        queen = Queen.new(a_board, [5,4], :white)
        expect(a_board[[3,4]]).to eq(:NullPiece)

        a_board.move_piece([5,4], [3,4])

        expect(queen.pos).to match([3,4])
        expect(a_board[[3,4]]).to eq(queen)
        expect(a_board[[5,4]]).to match(:NullPiece)  
    end

    it "find all the pieces on the board" do
        king = King.new(a_board, [4,4], :white)
        other_bishop = Bishop.new(a_board, [5,5], :black)
        queen = Queen.new(a_board, [3,6], :white)
        knight = Knight.new(a_board,[1,5], :black)
        rook = Rook.new(a_board, [7,3], :black)
        # # a_board[2][6] = :NullPiece
        # a_board[5][3] = :NullPiece

        # expect(a_board.pieces_on_the_board.map{|piece| piece.symbol}).to match_array([:K,:R,:Q,:Kn,:B])
        expect(a_board.pieces_on_the_board).to match_array([king, other_bishop, queen, knight, rook])
    end

    it "checks if the king is in check" do
        king = King.new(a_board, [7,0], :black)
        queen = Queen.new(a_board, [7,3], :white)

        expect(a_board.in_check?(:black)). to eq(true)
    end

    it "checks if the king is in check - part 2" do
        king = King.new(a_board, [5,3], :black)
        pawn = Pawn.new(a_board, [6,4], :white)

        expect(a_board.in_check?(:black)). to eq(true)
    end

    it "checks if the king is in check - part 3" do
        king = King.new(a_board, [5,3], :black)
        queen = Queen.new(a_board, [7,4], :white)

        expect(a_board.in_check?(:black)). to eq(false)
    end

    it "checks the duplicate board" do 
        king = King.new(a_board, [5,3], :black)
        queen = Queen.new(a_board, [7,4], :white)
        white_king = King.new(a_board, [0,0], :white)
        expect(a_board[[5,3]]).to eq(king)
        expect(a_board[[7,4]]).to eq(queen)
        
        new_board = a_board.duplicate()
        expect(new_board[[5,3]]).not_to eq(king)
        expect(new_board[[7,4]]).not_to eq(queen)
        expect(new_board[[5,3]].symbol).to eq(:K)
        expect(new_board[[7,4]].symbol).to eq(:Q)


        new_board.move_piece([7,4],[7,2])
        # doesnt affect old board
        expect(a_board[[5,3]]).to eq(king)
        expect(a_board[[7,4]]).to eq(queen)

        # doesnt move king
        expect(new_board[[5,3]].symbol).to eq(:K)
        # queen moves as expected
        expect(new_board[[7,2]].symbol).to match(:Q)
        expect(new_board[[7,4]]).to eq(:NullPiece)

        a_board.move_piece([7,4],[7,0])
        # move on old board doesnt affect next one
        expect(a_board[[5,3]]).to eq(king) 
        expect(a_board[[7,0]]).to eq(queen)
        expect(a_board[[7,4]]).to eq(:NullPiece)

        expect(new_board[[5,3]].symbol).to eq(:K)
        expect(new_board[[7,2]].symbol).to match(:Q)
        expect(new_board[[7,4]]).to eq(:NullPiece)
    end

    it "checks if the king is in checkmate?" do 
        a_board.place_pieces
        a_board.move_piece([5,1],[5,2])
        a_board.move_piece([4,6],[4,4])
        a_board.move_piece([6,1],[6,3])
        a_board.move_piece([3,7],[7,3])

        expect(a_board.checkmate?(:black)).to eq(true)
    end

    it "checks if king in check" do
        king = King.new(a_board, [4,5], :white)
        queen = Queen.new(a_board, [3,5], :black)
        bishop = Bishop.new(a_board, [4,3], :white)

        expect(a_board.pieces_on_the_board).to match_array([king, queen, bishop])

        expect(a_board.in_check?(:white)).to eq(true)
    end

    it "checks if king in check by pawn moving forward" do
        king = King.new(a_board, [5,4], :white)
        queen = Queen.new(a_board, [3,5], :black)
        pawn = Pawn.new(a_board, [5,3], :black)

        expect(a_board.in_check?(:white)).to eq(false)
    end

    it "checks if king in check by pawn moving diagonally" do
        king = King.new(a_board, [5,4], :white)
        queen = Queen.new(a_board, [3,5], :black)
        pawn = Pawn.new(a_board, [4,3], :black)

        expect(a_board.in_check?(:white)).to eq(true)
    end
end
