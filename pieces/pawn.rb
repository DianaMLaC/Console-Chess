require_relative '../piece.rb'

class Pawn < Piece
    attr_reader :start_row, 

    def initialize(start_pos, colour, symbol)
        @start_row = true
        @move_set = [
            [2,0], #move_set[0] is double step from start row
            [1,0], #move_set[1] is one_step
            [1,1], #move_set[2] is diagonal attack of rigth
            [1,-1] #move_set[3] is diagonal attack of left
        ]
        super(start_pos, colour, :P)
    end

    # returns an array of available moves
    def available_moves
        available_moves = forward_moves + side_attacks
    end
    
    def forward_dir
        self.colour == :white ? return 1 : return -1 
    end

    def forward_moves # only if those pos is empty
        if Board.empty?(self.pos)
            forward_moves = []
            row, col = self.pos #position at which the piece is on the board
            
            if at_start_row?
                forward_moves << [row + forward_dir, col] 
                forward_moves << [row + (2 * forward_dir), col]
                @start_row = false
    
                return forward_moves
            end
    
            new_row = row + forward_dir
            new_pos = [new_row, col]
            forward_moves << new_pos
            
            return forward_moves

        end
    end

    def side_attacks #only if possition is ocupied by opposite colour
        pos_attack = []
        row, col = self.pos

        if self.colour == :white
            new_row = row + 1
            new_col = col - 1
            new_pos1 = [new_row, new_col]
            
            if @board[new_pos1].color == :black
                pos_attack << new_pos1
            end
            
            new_col = col + 1
            new_pos2 = [new_row, new_col]
            
            if @board[new_pos2].color == :black
                pos_attack << new_pos2
            end
            
        end
        
        if self.colour == :black
            new_row = row + 1
            new_col = col - 1
            new_pos1 = [new_row, new_col]
            
            if @board[new_pos1].color == :white
                pos_attack << new_pos1
            end
            
            new_col = col + 1
            new_pos2 = [new_row, new_col]
            
            if @board[new_pos2].color == :white
                pos_attack << new_pos2
            end
        end
        return pos_attack
    end
    
    private

    def at_start_row?
        @start_row
    end


    # def move_set(start_pos)
    #     #move_set[0] is one_step
    #     #move_set[1] is double step from start row
    #     #move_set[2] is diagonal attack of rigth
    #     #move_set[3] is diagonal attack of left
    #     move_set = [
    #         [1,0],
    #         [2,0],
    #         [1,1],
    #         [1,-1]
    #     ]
    # end
end


# def place_black_pawns
#     @grid[6][0] = Pawn.new([0,6], :white, :P)
#     @grid[6][1] = Pawn.new([1,6], :white, :P)
#     @grid[6][2] = Pawn.new([2,6], :white, :P)
#     @grid[6][3] = Pawn.new([3,6], :white, :P)
#     @grid[6][4] = Pawn.new([4,6], :white, :P)
#     @grid[6][5] = Pawn.new([5,6], :white, :P)
#     @grid[6][6] = Pawn.new([6,6], :white, :P)
#     @grid[6][7] = Pawn.new([7,6], :white, :P)
# end

# def place_white_pawns
#     @grid[1][0] = Pawn.new([0,1], :black, :P)
#     @grid[1][1] = Pawn.new([1,1], :black, :P)
#     @grid[1][2] = Pawn.new([2,1], :black, :P)
#     @grid[1][3] = Pawn.new([3,1], :black, :P)
#     @grid[1][4] = Pawn.new([4,1], :black, :P)
#     @grid[1][5] = Pawn.new([5,1], :black, :P)
#     @grid[1][6] = Pawn.new([6,1], :black, :P)
#     @grid[1][7] = Pawn.new([7,1], :black, :P)
  