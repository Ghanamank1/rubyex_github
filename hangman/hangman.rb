#FIGURE OUT SAVING!


#2. method that displays the hangman when entry is wrong
#3. method to display the empty and taken word slots 
#4. count how many entries left before game over 
   #  (when hangman is showing completely)
#5. display the misses 
    # (6 make up a file handman)
#6. entry to accept guesses 
    # must be case insensitive
   
=begin
     ____
    |    |
    o    |
   /|\   |  
    |    |
   / \   |
         |
   ______|______
   
   Word: _ _ _ _ _ _ 

   Guess: _ 
   
   Misses: _, _ ,_ , _, _, _ 
=end

require 'yaml'

class Hangman

    def initialize 
        @word = []
        @misses = []
        @guesses = []
        @valid_entry
        play
    end

    def play
        dictionary
        puts 'WELCOME TO K.O.\'S HANGMAN'
        puts ''
        puts 'ONE OF THE DEADLIEST GAMES IN THE WORLD!'
        puts ''
        sleep(1)
        puts "You'll be guessing a #{@word.length} letter word!"
        puts ''
        puts 'BUT if you FAIL.........'
        puts "
                 ____
                |    |
                o    |
               /|\\   |  
                |    |
               / \\   |
                     |
              _______|______
              "     
        puts "YOU GET HUNG!"
        sleep(1)
        puts 'MUAHAHAHAHAHAHAHA'
        sleep(1)
        puts 'cough* cough*'
        sleep(1)
        puts 'Goodluck!'

        puts "word of the day is: #{@word}"
        puts ''            
        while !win?
        
            sleep(2)
            puts 'Please enter a letter:'
            entry = gets.chomp
            entry(entry)
            display_hangman
            
            puts ' Would you like to save your progress?'
            input = gets.chomp
            if input.downcase == 'yes'
                save
            end
            break if game_over? || win?
        end 
    end

    def game_over? 
        if @misses.length == 7
            puts 'GAME OVER!'
            sleep(1)
            puts "I'm sorry but you're dead"
            true
        end 
    end

    def win?
        if @valid_entry.join == @word
            puts 'WOW! YOU WON!'
            sleep(1)
            puts 'I honestly didn\'t think you\'ll make it!'
            puts 'NICE WORK!'
            true
        end 
    end

    def dictionary

        # use 5desk words for hangman dictionary 
             # word must be 5-12 characters long

        dictionary = File.read('5desk.txt').gsub(/\r|\n/, ' ')
        all_words = dictionary.split
        
        valid_words = all_words.select do |word| 
            word.length.between?(5, 12)
        end
        
        word = valid_words.sample.upcase
        
        @word = word
        @valid_entry = Array.new(@word.length, ' _ ')
        @word
    end

    def display_hangman

        # method that displays the hangman when entry is wrong
        puts "
        #{hangman}
       Word: #{@valid_entry.join}

       Guess: #{@guesses} 
       
       Misses: #{@misses.join(', ')}
       
       Misses array is: #{@misses.length}

       Game over? #{game_over?}
        
        "
    end

    def hangman
        #check the misses for the hangman @misses
        if @misses.empty?
            puts "
             ____
            |    |
                 |
                 |  
                 |
                 |
                 |
          _______|______

          7 missed attempts until Game Over!
             "     
        elsif @misses.length == 1
            puts "
             ____
            |    |
            o    |
                 |  
                 |
                 |
                 |
          _______|______
        
          6 more attempts 
             "     
        elsif @misses.length == 2
            puts "
             ____
            |    |
            o    |
           /     |  
                 |
                 |
                 |
          _______|______

          5 more attempts
             "     
        elsif @misses.length == 3
            puts "
             ____
            |    |
            o    |
           /|    |  
                 |
                 |
                 |
          _______|______
             "     
        elsif @misses.length == 4
            puts "
             ____
            |    |
            o    |
           /|\\   |  
                 |
                 |
                 |
          _______|______
             "     
        elsif @misses.length == 5
            puts "
             ____
            |    |
            o    |
           /|\\   |  
            |    |
                 |
                 |
          _______|______
             "     
        elsif @misses.length == 6
            puts "
             ____
            |    |
            o    |
           /|\\   |  
            |    |
           /     |
                 |
          _______|______
             "     
        elsif @misses.length ==  7
            puts "
             ____
            |    |
            o    |
           /|\\   |  
            |    |
           / \\   |
                 |
          _______|______
             "     
        end
    end

    def is_integer?(entry)
        #checks if entry is an integer
        entry.to_i.to_s == entry
    end

    def entry(letter)
    
        if letter.to_s.length == 1 && !is_integer?(letter)
            # taking in the guess to be displayed
            @guesses = letter

            # made entry case insensitive 
            if @word.match?(letter.upcase)
                # inserts entry into valid entry array to be displayed
                letters = @word.split('') 
                letters.each_with_index do |value, index|
                    if value == letter.upcase
                        @valid_entry[index.to_i] = letter.upcase
                    end 
                end
                @valid_entry
            else
                # puts entry into the misses array to be displayed
                @misses.push(letter)
                @misses
            
            end  
        else 
            puts '#####################################################'
            puts 'Error: You must insert 1 letter'
            puts '#####################################################'
        end
    end   

    def save
        yaml = YAML::dump(
            :word => @word,
            :misses => @misses,
            :guesses => @guesses,
            :valid_entry => @valid_entry
        )
        game_file = File.new('savedgames.yaml', 'w+')
        game_file.puts(yaml)
    end

    def load_game
        game_file = File.open('savedgames.yaml')
        yaml = game_file.read
        YAML::load(yaml)
    end
end

Hangman.new

