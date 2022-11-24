require 'rspec'
require 'board'
require 'pieces/queen'
require 'pieces/pawn'
require 'pieces/king'
require 'pieces/bishop'




describe Queen do
    let(:a_board) {Board.new()}
      
    describe "initialize" do 
        it "creates a Queen" do
            queen = Queen.new(a_board, [3,7], :white)
            expect(queen.pos).to eq([3,7])
        end
    end

    it "can move freely if nothing on its path" do
        queen = Queen.new(a_board, [5,4], :white)

        # double check this
        expect(queen.available_moves).to match_array([
            [1,0],[2,1],[3,2],[4,3],[6,5],[7,6],
            [2,7],[3,6],[4,5],[6,3],[7,2],
            [5,0],[5,1],[5,2],[5,3],[5,5], [5,6],[5,7],
            [0,4],[1,4],[2,4],[3,4],[4,4],[6,4],[7,4]
        ])
    end

    it "cannot move past its own pieces" do
        queen = Queen.new(a_board, [5,4], :white)
        king = King.new(a_board, [5,6], :white)
        pawn = Pawn.new(a_board, [3,2], :white)

        # double check this
        expect(queen.available_moves).to match_array([
            [4,3],[6,5],[7,6],
            [2,7],[3,6],[4,5],[6,3],[7,2],
            [5,0],[5,1],[5,2],[5,3],[5,5],
            [0,4],[1,4],[2,4],[3,4],[4,4],[6,4],[7,4]
        ])
    end

    it "can take the opposite piece" do
        queen = Queen.new(a_board, [5,4], :white)
        king = King.new(a_board, [5,6], :white)
        pawn = Pawn.new(a_board, [3,2], :black)

        # double check this
        expect(queen.available_moves).to match_array([
            [3,2],[4,3],[6,5],[7,6],
            [2,7],[3,6],[4,5],[6,3],[7,2],
            [5,0],[5,1],[5,2],[5,3],[5,5],
            [0,4],[1,4],[2,4],[3,4],[4,4],[6,4],[7,4]
        ])
    end

    it "cannot move when surrounded" do
        queen = Queen.new(a_board, [0,7], :white)
        king = King.new(a_board, [1,6], :white)
        pawn = Pawn.new(a_board, [0,6], :white)
        bishop = Bishop.new(a_board,[1,7], :white)

        expect(queen.available_moves).to match_array([])
    end
end
