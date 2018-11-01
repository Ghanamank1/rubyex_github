# board class (boxes, playerX, playerO)
    # add x or o on the board
    # box hash must be made with all 9 boxes
    # make a move box, puts value in box ^ hash with the corresponding box
    # methods to display board- 3 arrays for rows
# box class ()
# player class (x,o) name, name 
class Board
    attr_accessor :playerO, :playerX

    def initialize( playerX, playerO )
        @playerX = playerX
        @playerO = playerO
        @boxes = {
            "topleft" => '-' , "topmid" => '-' , "topright" => '-', 
            "midleft" => '-' , "midmid" => '-' , "midright" => '-', 
            "botleft" => '-' , "botmid" => '-' , "botright" => '-'
        }        
    end
    
    def check(position, mark)
        @boxes[position] = mark 
        puts @boxes
        display
    end

    def display
        
        @top = [ @boxes["topleft"] , @boxes["topmid"] , @boxes["topright"] ]
        @mid = [ @boxes["midleft"] , @boxes["midmid"] , @boxes["midright"] ]
        @bot = [ @boxes["botleft"] , @boxes["botmid"] , @boxes["botright"] ]

        puts @top.join(' ')
        puts @mid.join(' ')
        puts @bot.join(' ')
    end
end

class PlayerX
    attr_accessor :name

    def initialize(name)
        @name = name 
    end
end

class PlayerO 
    attr_accessor :name

    def initialize(name)
        @name = name
    end
end

class Box
    def initialize( value )

    end
end

player2 = PlayerO.new("John")
player1 = PlayerX.new("me")
game1 = Board.new(player1, player2)

game1.check("topleft", "X" )
game1.check("topright", "O")
game1.check("topmid", "X")
game1.check("midleft", "X")
game1.check("botleft", "X")

thing = gets.chomp
=begin
    8 ways of willing

        board filled without any of this, is draw! (else)
    top row
    mid row
    bot row
        left col
        mid col
        right col
            right diag
            left diag
=end

how is a draw
how the board starts
how is a victory 
how to check result
how to validate cell
check if cell is free
how to pick player
displaying board
    place token?
play the game!