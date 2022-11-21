require 'rspec'
require 'pieces/rook'
require 'board'
#require 'pieces/ANOTHERPIECE'



describe Rook do
    let(:a_board) {Board.new()}
      
    describe "initialize" do 
        it "creates a Rook" do
            rook = Rook.new(a_board, [0,7], :white)
            expect(rook.pos).to eq([0,7])
        end
    end

    it "can move freely if nothing on its path" do
        rook = Rook.new(a_board, [5,4], :white)

        expect(rook.available_moves).to match_array([
            [5,0],[5,1],[5,2],[5,3],[5,5], [5,6],[5,7],
            [0,4],[1,4],[2,4],[3,4],[4,4],[6,4],[7,4]
        ])
    end
    
    it "cannot move past its own pieces" do
        rook = Rook.new(a_board, [5,4], :white)
        king = King.new(a_board, [5,6], :white)
        pawn = Pawn.new(a_board, [3,4], :white)

        expect(rook.available_moves).to match_array([
            [5,0],[5,1],[5,2],[5,3],[5,5],
            [4,4],[6,4],[7,4]
        ])
    end

    it "can take the opposite piece" do
        rook = Rook.new(a_board, [5,4], :white)
        pawn = Pawn.new(a_board, [5,1], :black)

        expect(rook.available_moves).to match_array([
            [5,1],[5,2],[5,3],[5,5], [5,6],[5,7],
            [0,4],[1,4],[2,4],[3,4],[4,4],[6,4],[7,4]
        ])
    end

    it "cant move when surrounded" do
        rook = Rook.new(a_board, [0,7], :white)
        king = King.new(a_board, [1,7], :white)
        pawn = Pawn.new(a_board, [0,6], :white)

        expect(rook.available_moves).to match_array([])
    end

    #TODO: castling
end
