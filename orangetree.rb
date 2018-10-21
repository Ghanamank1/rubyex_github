# class orangeTree 
#height method that return height 
#oneYearPasses method, when called ages the tree one year
#each year it grows  
#after some number of years, tree should die. 
#for first years should have no fruit 
# after a while it should 
#old tree produce more each year than younder, 
#should be able to countTheOranges 
# and pickAnPrange (reduce the $orangeCount by 1)
# returns string sayin how delicious orange was 
# and if theres no more 
# oranges not picked fall off next year (refresh)
# end

class OrangeTree 
    def initialize 
        @currentHeight = 0
        @year = 0 
        @orange = 0
        @picked = 0
        @treeAge = 0
        @fruits = 0
    end 
    def oneYearPasses
        @year = 0
        @year = @year + 1 
        @currentHeight = @currentHeight.to_i + @year.to_i
        @currentHeight = @currentHeight.to_s + " meters"
        @treeAge = @treeAge.to_i + @year.to_i  
        @treeAge = @treeAge.to_s + " years old"
        @oranges = 0
        @oranges = (@oranges.to_i + @year.to_i+ 25)**2
        @oranges = @oranges.to_s + " oranges"
        @picked = 0
    end
    def height
        @currentHeight
    end 
    def age
        @treeAge
    end 
   # def death 
   # end
   def pickOrange
        1.times do 
       @picked = @picked.to_i + 1
        return "mmm delicious, what a great orange"
        end
    end
    def fruits
        @oranges = @oranges.to_i - @picked.to_i 
        @picked = 0
        @oranges = @oranges.to_s + " oranges"
    end
    # def showing
    
   # end 
    
end

tree = OrangeTree.new 

tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses


puts tree.height
puts tree.age
puts tree.fruits
puts tree.pickOrange
puts tree.fruits

tree.oneYearPasses

puts tree.pickOrange
puts tree.pickOrange
puts tree.pickOrange
puts tree.pickOrange
puts tree.fruits

puts tree.age
puts tree.fruits
puts tree.fruits
puts tree.fruits
puts tree.height
puts tree.age

tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses

puts tree.age
puts tree.fruits
puts tree.height
puts tree.pickOrange
puts tree.pickOrange
puts tree.pickOrange
puts tree.pickOrange
puts tree.fruits
puts tree.fruits
