        puts "The Starting year please"
        startyear = gets.chomp.to_i

        puts "The Ending year please"
        endyear = gets.chomp.to_i

        puts "Thank you"

while endyear >= startyear

        (startyear..endyear).each do |year| 
            if ( year % 4 == 0 and year % 100 != 0 ) or 
                (year % 100 == 0 and year % 400 == 0)
            
                puts year 

            end
            startyear = startyear.to_i + 1
        end
end