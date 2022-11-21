require 'rspec'
require 'pieces/knight'
require 'board'
#require 'pieces/ANOTHERPIECE'



describe Knight do
    let(:a_board) {Board.new()}
      
    describe "initialize" do 
        it "creates a Knight" do
            knight = Knight.new(a_board, [1,7], :white)
            expect(knight.pos).to eq([1,7])
        end
    end
    
   
    it "moves in L-shape" do
        knight = Knight.new(a_board, [3,4], :white)

        expect(knight.available_moves).to match_array([
            [2,2],[4,2],[1,3],[1,5],[2,6],[4,6],[5,3],[5,5]
        ])
    end

    it "can take opposite piece" do
        knight = Knight.new(a_board, [3,4], :white)
        opposite_pawn = Pawn.new(a_board,[2,2], :black)

        expect(knight.available_moves).to match_array([
            [2,2],[4,2],[1,3],[1,5],[2,6],[4,6],[5,3],[5,5]
        ])
    end

    it "cannot move to square occupied by same colour" do
        knight = Knight.new(a_board, [3,4], :white)
        opposite_pawn = Pawn.new(a_board,[2,2], :white)

        expect(knight.available_moves).to match_array([
            [4,2],[1,3],[1,5],[2,6],[4,6],[5,3],[5,5]
        ])
    end
end
