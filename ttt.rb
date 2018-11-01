class Game
    def initialize
        player1 = "Brian" # gets.chomp.to_s
        player2 =  "Kwaku" # gets.chomp.to_s
        @player1 = Player.new(player1)
        @player1 = Player.new(player2)
        @board = Board.new(player1,player2)
        play
    end

    def play
        puts "WELCOMG TO K.O.'s FIRST FULL GAME!"
        puts ""
        puts " Player 1 is : #{@board.player1} " 
        puts " Player 2 is : #{@board.player2} " 
        puts " Have fun! "
        puts ''
        
        @board.display_board
            
        loop do 
            puts "It's your turn #{@board.current_player}"
            puts "Enter the row and collumn of your choice:"
            puts ''
            input = gets.chomp.to_s
            numbers = input.split(",")
            
            # Making a move
            @board.make_move( numbers[0].to_i, numbers[1].to_i )
           
            while @board.invalid_entry?
                input = gets.chomp.to_s
                numbers = input.split(",")
                # Making a move
                @board.make_move( numbers[0].to_i, numbers[1].to_i )
            end
            

            @board.display_board
            # Win or Draw?

            break if @board.win? || @board.draw?
        end

    end
end

class Player 
    attr_accessor :name

    def initialize(name)
        @name = name
    end
end

class Board 
    attr_reader :player1, :player2
    def initialize(player1, player2)
        @player1 = Player.new(player1)
        @player2 = Player.new(player2)
        @board = Array.new(3){Array.new(3,'-')}
        @player_turn = @player1
    end

    def player1 
        @player1.name
    end
    
    def player2
        @player2.name
    end 

    def clear_board
        @board = Array.new(3){Array.new(3,'-')}
    end

    def display_board 
        puts "Please put the correct row/column! Example: Row,Col = 1,2"
        puts "
                    Column \n
                   1   2   3
            R   1  #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} \n
            o   2  #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} \n
            w   3  #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}
        "
    end
    
    def current_player
        @player_turn.name
    end

    def switch_player
        @player_turn == @player1 ? @player_turn = @player2 : @player_turn = @player1
    end 

    def make_move(row,col)
            
            @entry = row, col
        if @board[row-1][col-1] == '-'
            if @player_turn == @player1
                @board[row-1][col-1] = "X"
            else
                @player_turn == @player2
                @board[row-1][col-1] = "O"
            end            
            switch_player
        else 
            puts "Error: Spot is already taken! Choose another one"
            puts ''
        end    
    end

    def invalid_entry?
        if @entry[0] > 3 || @entry[1] > 3 || @entry[0] < 0 || @entry[1] < 0
            puts " Incorrect row/col! row and col must be within 1 and 3 "
            true
        end
    end

    def draw? 
        cells = []
        @board.each { |row| 
            row.each {|box|
                if box != '-'
                    cells.push(true)
                else 
                    cells.push(false)
                end
            }
        }
        if cells.none?(false)
            puts "THIS GAME IS A DRAW"
            true
            clear_board
        end
    end

    def win?
        diag = []     

        diag.push( [ @board[0][0] , @board[1][1] , @board[2][2] ] ) 
        diag.push( [ @board[0][2] , @board[1][1] , @board[2][0] ] )

       if   @board[0].all?("X") || @board[0].all?("O") ||
            @board[1].all?("X") || @board[1].all?("O") ||
            @board[2].all?("X") || @board[2].all?("O") || 
            diag[0].all?("X") || diag[0].all?("O") || 
            diag[1].all?("X") || diag[1].all?("O") ||
            @board.transpose[0].all?("X") || @board.transpose[0].all?("O") ||
            @board.transpose[1].all?("X") || @board.transpose[1].all?("O") ||
            @board.transpose[2].all?("X") || @board.transpose[2].all?("O")       
            puts " #{current_player} WINS!"
            true
            clear_board
       end   
    end
end

Game.new


