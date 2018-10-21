

dictionary = [
    "below","down","go","going","horn","how","howdy",
    "it","i","low","own","part","partner","sit"
]

def substrings string, dictionary 
    hash = {}
    words = string.split(' ')
    
    words.each { |w|
  #  puts w
   # puts w[-1]
    #puts w[-1].is_a? String

 #       letters = []
        lets = w.split('')
        lets.each {|l|

=begin
            letters.push(l)
            temp = letters.join
            letters = []
            letters.push(temp)
=end
            for i in 1..(w.length)

                a= w.index(l.to_s)
                b= w.index(w[-i])
                @temp = w[a,b]
            end
            if w.index(l) == w.index(w[0])
                
                a= w.index(l.to_s)
                b= w.length
            subt = w[ a,b ]
            puts subt
            else 
                    a= w.index(l.to_s)
                    b= w.index(w[w.length-1])
                    
                    subt = w[ a,b ]
                    puts subt
            end

            dictionary.each { |dic|
                if dic == subt.downcase || dic == @temp.downcase
                    if hash[dic].to_i > 0
                        number = hash[dic]
                    else 
                        number = 0
                    end
                hash[dic] = number
                hash[dic] += 1
                end
            } 
        }
    }


    return hash
end

puts substrings "Howdy partner, sit down! How's it going?", dictionary
