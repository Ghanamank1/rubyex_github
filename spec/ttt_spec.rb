#./spec/ttt.rb

# require './ttt'
=begin
RSpec.describe Board do
    describe "tictactoe board" do
        it 'player 1: "X" making a move' do
            board = Board.new('player1', 'player2')
            expect(board.current_player).to eql('player1')
            expect(board.make_move(1,2)).to eql('X')           
        end

        #it 'entering an invalid move' do 
          #  board = Board.new('player1', 'player2')
           # expect(board.current_player).to eql('player1')
           # expect(board.make_move(1,1)).to eql('X')
           # expect(board.make_move(2,1)).to eql('X')
        #end
    end
end
=end