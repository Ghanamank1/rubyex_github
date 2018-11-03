#FIGURE OUT SAVING!

#1. use 5desk dictionary for words 
     #  word must be 5-12 characters long
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

# class Hangman

#    def initialize 

 #   end
 words = File.read('5desk.txt')
    puts words
 #valid_words = words.select do |word| 
  #   word.length.between?(5, 12)
 #end

    # def dictionary

#puts valid_words
    # end
# end

# game1 = Hangman.new 

# game1.dictionary