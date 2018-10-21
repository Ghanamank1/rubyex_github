def englishNumber number 
    if number < 0 
        return "Please put in only positive numbers"
    end 
    if number == 0
        return "Zero"
    end 
    
    numString = ''

    hundredthousands = [
        "one hundred", "two hundred", "three hundred",
        "four hundred", "five hundred", "six hundred",
        "seven hundred", "eight hundred", "nine hundred"
    ]

    tenthousands = [
        "ten thousand", "twenty thousand", "thirty thousand",
        "fourty thousand", "fifty thousand", "sixty thousand",
        "seventy thousand", "eighty thousand", "ninety thousand"
    ]

    teenthousands = [
        "eleven thousand", "twelve thousand",
        "thirteen thousand", "fourteen thousand", 
        "fifteen thousand", "sixteen thousand",
        "seventeen thousand", "eighteen thousand",
        "nineteen thousand"
    ]

    thousands = [
        "one thousand", "two thousand", "three thousand", "four thousand", 
        "five thousand", "six thousand", "seven thousand", "eight thousand",
        "nine thousand"
    ]
    
    hundreds = [
        "one hundred", "two hundred", "three hundred",
        "four hundred", "five hundred", "six hundred",
        "seven hundred", "eight hundred", "nine hundred"   
    ]
    
    tens = [
        "ten", "twenty", "thirty", "fourty", "fifty",
        "sixty", "seventy", "eighty", "ninety"
    ]
    
    teenagers = [ 
        "eleven", "twelve", "thirteen", "fourteen",
        "fifteen", "sixteen", "seventeen", "eighteen",
        "nineteen"
    ]
    
    ones = [ 
        "one", "two", "three", "four", "five", "six",
        "seven", "eight", "nine"
    ]

    left = number 
    write = number/1000000 #number of millions
    left = left - write*1000000 #subtract the millions

    if write > 0 

        million = englishNumber write 
        numString = numString + million + " million"


        if left > 0

            numString = numString + ' '
        end 
    end 

    write = left/100000 #number of hundred thousands 
    left = left - write*100000 #subtract the hundred thousands

    if write > 0
        if ((write >= 1) and (left > 0)) 
            numString = numString + hundredthousands[write-1] + " "
        end
        if ((write >= 1) and (left == 0))
            numString = numString + hundredthousands[write-1] + " thousand"
        end
    end

    write = left/10000 #number of ten thousands 
    left = left - write*10000 #subtract the ten thousands

    if write > 0 
        if ((write ==1) and (left == 0))
            numString = numString + tenthousands[write-1]
        end
        if ((write ==1) and (left > 0))
            write = left / 1000
            numString = numString + teenthousands[write-1]
        end 
    end 
#############################################################

# i put 16100 and it only returned sixteen thousand six thousand
# which is wrong... need to fix it from about here onwardsss

############################################################

    write = left/1000 #number of thousands 
    left = left - write*1000 #subtract the thousands
    
    if write > 0 
        if ((write >=1) and (left >= 0))
            numString = numString + thousands[write-1]
        end
    end 

    write = left/100 #number of hundreds
    left = left - write*100 #subtract the hundreds

    if write > 0
        if ((write >= 1) and (left > 0))
            numString = numString + hundreds[write-1]
        end
    end

    write = left/10 #number of tens left to write
    left = left - write*10 #subtract of those tens

    if write > 0
        if ((write == 1) and (left > 0))
            numString = numString + tens[write-1]
        
            left = 0
        else 
            numString = numString + tens[left-1]
        end 

        if left > 0
            numString = numString + '-'
        end
    end

    write = left # number of ones left 
    left = 0 # subtract the ones 

    if write > 0 
        numString = numString + ones[write-1]
    end 

    numString
end 

puts englishNumber(16100)