=begin
    computer selects and i guess 
        needed
    2 players (codemaker, codebreaker)
    decoding board (
        6 color selection
        4 color code - duplicates and blanks allowed
        guess order and color of code!
        white (if the color is inthe code but in wrong position)
        black (if its in right position and color)
            only tell one of each/ if duplicates!
        
        points! 
            codemaker gets point if codebreaker guesses wrong
            2 points for codemaker in final round

    )
    12 games played?? (odin)
=end 

# player #class
=begin
codebreaker 
codemaker 
=end
# computer # class
=begin
codebreaker
codemaker
=end
# decoding board 
class Player
    def initialize(name)
        @name = name
    end
end

class Computer
    def initialize(name)
        @name = name
    end
end

class Board 
    def initialize 
        @player = Player.new("Kwaku")
        @computer = Computer.new("Jarvis")
        @password = []
        @colors = ["red", "blue", "green", "yellow", "purple", "orange", 'blank']
        @turns = 0
        @result_array = []
        @check_comma = []
    end

    # have to make this block work in guess the password!
=begin
    def start_game
        while @turns < 1
          #  players("K.O.")
            codebreaker = gets.chomp
            if codebreaker == "computer"
                puts @result_array.inspect
                comp_guess = @colors.sample(4)
                puts "computer guess is:"
                puts comp_guess.inspect
                comp_string = comp_guess.join(' ')
                puts "COMPUTER STRING IS:"
                puts comp_string.inspect
                puts "ENTRIES IS:"
                puts entries.inspect
                while @result_array.to_a.count(true) < 4
                   
                    guess(comp_string)
                    check_entry
                    puts @result_array.inspect
                    @result_array.to_a.each { |val|

                        if val == true
                            comp_guess[@result_array.index(true)] = comp_guess[@result_array.index(true)]
                        end
                    }      
                    break if @result_array == nil  || @result_array == []            
                end
                @turns += 1
                puts @turns
            else

                input = "green green green red"
                guess(input)
                check_entry

                 # turn made
                @turns += 1
                puts @turns
            end
        end
    end
=end
    def guess(array)

        puts "THE 'ARRAY' IN GUESS IS?"
        puts array

        check_comma = []
        
        if array.split('').any?(",")
            new_check = array.split('')
            new_check.delete(",")
            @check_comma = new_check.join.split(' ')
        
        else 
            @check_comma = array.split(' ')
        end

        if @check_comma.length > 4 || @check_comma.length < 0
            puts "Error"
        else
            @check_comma.each { |guess|

                    if @colors.any?(guess.downcase)
                        true
                    else 
                        puts "Invalid Entry: #{guess} must match the right colors! Must match ones below!"
                        puts "e.g. #{@colors[0]}, #{@colors[1]}, #{@colors[2]}, #{@colors[3]}, #{@colors[4]}, #{@colors[5]}, #{@colors[6].upcase}"
                    end
            }
            @check_comma
        end
        puts "CHECK COMMA is: "
        puts @check_comma.inspect
    end
    def password
        @password
    end

    def input_password(entry)
        temp_password = []

        if entry.split('').any?(",")
            new_check = entry.split('')
            new_check.delete(",")
            temp_password = new_check.join.split(' ')
        
        else 
            temp_password = entry.split(' ')
        end
        if temp_password.length > 4 || temp_password.length < 0
            puts "Error: Password must have 4 valid entries"
        else
            @password = temp_password
        end
    end
=begin
    def players(codemaker, codebreaker = nil)
        computer = codemaker.downcase

        if codemaker == "computer" 
            generate_password
        else
            input_password("red, red, red, red")
        end
        if codebreaker == "computer"

        else

        end
    end
=end
    def generate_password
        @password = ["orange", "green", "red", "blue"]
      #  4.times do 
       # @password.push(@colors.sample.to_s)
        #end
    end

    def check_entry
        result_array = []
        puts "THE CHECKED ARRAY INSIDE OF CHECK ENTRY:"
        puts @check_comma.inspect
        if @check_comma.length > 4 || @check_comma.length < 0
            puts "There must be 4 entries"
        else
            for i in 0..@password.length - 1
                if @check_comma[i].downcase == @password[i].downcase && @password.any?(@check_comma[i].downcase)
            
                    puts "'#{@check_comma[i].upcase}' is correct POSITION AND COLOR!"
                    result_array.push(true)

                elsif @check_comma[i].downcase != @password[i].downcase && @check_comma.any?(@password[i].upcase)
                
                    puts "'#{@password[i].upcase}' in WRONG POSITION"            
                    result_array.push(false)
                else
                    result_array.push(false)
                end   
            end  
        end   
        puts "THE RESULT ARRAY!"
        @result_array = result_array.to_a
        puts @result_array.inspect 
        puts result_array.inspect
        @result_array
    end

    def guess(array)

        puts "THE 'ARRAY' IN GUESS IS?"
        puts array

        check_comma = []
        
        if array.split('').any?(",")
            new_check = array.split('')
            new_check.delete(",")
            @check_comma = new_check.join.split(' ')
        
        else 
            @check_comma = array.split(' ')
        end

        if @check_comma.length > 4 || @check_comma.length < 0
            puts "Error"
        else
            @check_comma.each { |guess|

                    if @colors.any?(guess.downcase)
                        true
                    else 
                        puts "Invalid Entry: #{guess} must match the right colors! Must match ones below!"
                        puts "e.g. #{@colors[0]}, #{@colors[1]}, #{@colors[2]}, #{@colors[3]}, #{@colors[4]}, #{@colors[5]}, #{@colors[6].upcase}"
                    end
            }
            @check_comma
        end
        puts "CHECK COMMA is: "
        puts @check_comma.inspect
    end

    def entries
        @check_comma = @check_comma
        @check_comma
    end
end

game = Board.new
# puts game.generate_password
# game.start_game
game.guess("blue, green, red, orange")
game.generate_password
game.check_entry
puts ''
puts ''
puts "PASSWORD"
puts game.password.inspect
puts "ENTRY/GUESS"
puts game.entries.inspect


=begin
6 digits
=end