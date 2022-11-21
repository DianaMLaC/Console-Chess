require 'rspec'
require 'pieces/bishop'
require 'board'
require 'pieces/queen'



describe Bishop do
    let(:a_board) {Board.new()}
      
    describe "initialize" do 
        it "creates a bishop" do
            bishop = Bishop.new(a_board, [2,7], :white)
            expect(bishop.pos).to eq([2,7])
        end
    end
    
    it "can move freely if nothing on its path" do
        bishop = Bishop.new(a_board, [5,4], :white)
        moves = bishop.available_moves

        expect(moves).to match_array([
            [1,0],[2,1],[3,2],[4,3],[6,5],[7,6],
            [2,7],[3,6],[4,5],[6,3],[7,2]
        ])
    end

    
    it "cannot move past its own pieces" do
        bishop = Bishop.new(a_board, [5,4], :white)
        king = King.new(a_board, [3,6], :white)
        moves = bishop.available_moves

        expect(moves).to match_array([
            [1,0],[2,1],[3,2],[4,3],[6,5],[7,6],
            [4,5],[6,3],[7,2]
        ])
    end

    it "can take the opposite piece" do
        bishop = Bishop.new(a_board, [5,4], :white)
        king = King.new(a_board, [3,6], :white)
        opposite_bishop = Bishop.new(a_board, [3,2], :black)
        moves = bishop.available_moves

        expect(moves).to match_array([
            [3,2],[4,3],[6,5],[7,6],
            [4,5],[6,3],[7,2]
        ])
    end

    it "cant move when surrounded" do
        bishop = Bishop.new(a_board, [0,0], :black)
        king = King.new(a_board, [1,1], :black)

        expect(bishop.available_moves).to match_array([])
    end
end
