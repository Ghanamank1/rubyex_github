class Cipher 
    def caesar_cipher string, pick

        alphabet = []
        letters = ("a".."z").each {|k| alphabet.push(k)}

        word = string.split('')
        ceasar = []

        word.each do |lets|
            if lets === " " 
                ceasar.push(" ")

            elsif lets =~ /[^a-zA-Z]/
                ceasar.push(lets)
            else
                if (alphabet.index(lets)+ pick.to_i) > 26
                    ceasar.push(
                    alphabet[(alphabet.index(lets) + pick.to_i)-26]
                )

                else
                ceasar.push(
                    alphabet[alphabet.index(lets) + pick.to_i]
                )
                end
            end
        end

        ceasar.join.capitalize
    end
end 


