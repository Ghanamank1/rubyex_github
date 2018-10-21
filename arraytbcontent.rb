tbc = ["Table of Contents", 
        "Chapter 1: Numbers",   "page 1",
        "Chapter 2: Letters",   "page 72",
        "Chapter 3: Variables", "page 118"]

tbc.each do |input|
    lineWidth = 50
    
    if ((tbc.index(input) % 1 == 0) and (tbc.index(input) % 2 != 0))
        left=input.ljust(lineWidth/2) 
    else 
        if ((tbc.index(input) % 1 == 0) and (tbc.index(input) % 2 == 0))
        right = input.rjust(lineWidth/2) 
        end
    end
    puts left.to_s + right.to_s  
end

