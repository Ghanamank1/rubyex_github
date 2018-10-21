def caesar_cipher string, pick

    alphabet = []
    letters = ("a".."z").each {|k| alphabet.push(k)}

    word = string.split('')
    ceasar = []

    word.each do |lets|
        if lets === " " 
            ceasar.push(" ")

        elsif lets === "!"
            ceasar.push("!")
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

    puts ceasar.join.capitalize.inspect
end

caesar_cipher "what a string!", 5