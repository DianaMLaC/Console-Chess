require 'rspec'
require 'pieces/queen'
require 'board'
#require 'pieces/ANOTHERPIECE'



describe Queen do
    let(:a_board) {Board.new()}
      
    describe "initialize" do 
        it "creates a Queen" do
            queen = Queen.new(a_board, [3,7], :white)
            expect(queen.pos).to eq([3,7])
        end
    end
    #it can move diagonally and horizontally
    #it can move freely if nothing on its path
    #it can move freely until something in its path
    #it cannot move past a piece in its way
    #it can take the opposite piece
    #it cannot move to a square occupied by same colour
end
