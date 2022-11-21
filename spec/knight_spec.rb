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
    
   
    #it can move freely if nothing around it
    #it can take opposite piece
    #it cannot move to a square occupied by same colour
end
