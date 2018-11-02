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

    def start_game
        codebreaker = gets.chomp.downcase
        if codebreaker == "computer"
            puts 'PLEASE ENTER YOUR PASSWORD'
            puts 'Format: red, blue, green, yellow'
            puts ''
            puts "Acceptable entries #{@colors.join(' ')}"
            password = gets.chomp.downcase
            while guess(password) 
                make_password(password)
                
                puts 'YOU HAVE SUCCESSFULLY GENERATED A PASSWORD'
                comp_guess = @colors.sample(4)
                            
                while @turns < 2    
                    puts "computer guess is:"
                    puts comp_guess.inspect
                    
                    # making the input an array to an acceptable string
                    comp_string = comp_guess.join(' ')

                    # holds all the values for the correct password
                    correct_entries = Array.new(4, nil)
                            
                    guess(comp_string)
                    check_entry

                    @result_array.to_a.each_with_index { |val,spot|
                                
                        if val == true                
                                    
                            correct_entries.push[spot] = comp_guess[spot]

                        elsif val == false

                            correct_entries.push[spot] = @colors.sample
                        end
                    }      

                    # turn made
                    @turns += 1  if make_password(password)
                    puts "TURN:#{@turns} " 

                    comp_guess = correct_entries
                end
            end
        else
            generate_password
            puts 'COMPUTER HAS GENERATED A PASSWORD!'
            puts ''
            puts 'PLEASE ENTER YOUR GUESS OF THE PASSWORD'
            puts 'Format: red, blue, green, yellow'
            puts ''
            puts "Acceptable entries #{@colors.join(' ')}"
            while @turns < 2
                
                input = gets.chomp
                guess(input)
                check_entry

                # turn made
                @turns += 1 if guess(input)
                puts "TURN:#{@turns} " 
                
            end
        end
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
                        false
                    end
            }
            @check_comma
        end
    end

    def make_password(array)
        @password = guess(array)
    end

    def generate_password
        4.times do 
            @password.push(@colors.sample.to_s)
        end
    end

    def check_entry
        result_array = []
       
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
        @result_array = result_array.to_a
        @result_array
    end

    def guess(array)

        check_comma = []
        
        if array.split('').any?(",")
            new_check = array.split('')
            new_check.delete(",")
            @check_comma = new_check.join.split(' ')
        
        else 
            @check_comma = array.split(' ')
        end

        if @check_comma.length != 4
            puts "Error"
        else
            @check_comma.each { |guess|

                    if @colors.any?(guess.downcase)
                        true
                    else 
                        puts "Invalid Entry: #{guess} must match the right colors! Must match ones below!"
                        puts "e.g. #{@colors[0]}, #{@colors[1]}, #{@colors[2]}, #{@colors[3]}, #{@colors[4]}, #{@colors[5]}, #{@colors[6].upcase}"
                        false
                        return 
                    end
            }
            @check_comma
        end
    end

    def entries
        @check_comma
    end
end

game = Board.new

game.start_game
