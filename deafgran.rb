talking = ''

while talking != "BYEBYEBYE" 
    talking = gets.chomp
    if (talking == talking.upcase and talking != "BYEBYEBYE")
            number = 1930 + rand(21) 
        puts "not since " + number.to_s
    else 
        if talking == "BYEBYEBYE"
           puts "BYE MY BOY!"
        else
            puts "HUH?! SPEAK UP, SONNY!"
        end
    end 
end 