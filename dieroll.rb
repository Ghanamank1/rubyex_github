class Die 
    def initialize 
    @variable = 3
    end
    def roll
        @variable = 1 + rand(6)    
    end
    def showing 
        @variable
    end 
end

dice = Die.new
puts dice.showing
puts dice.roll
puts dice.showing