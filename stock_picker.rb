def stock_picker array

    log = {}

    array.select do |n|
                        
        array.select do |m|
            if array [ array.index(m) + 1 ] != nil && array.index(m)>=array.index(n)

               
                value = array[ array.index(n) ] - array[array.index(m) + 1] 
                key = array [ array.index(n)] , array [ array.index(m)+1 ]
            end
            
            log[key] = value 
            log.delete(nil)

        end
    end
    
    stock = log.sort_by { |key,value| 
        value
    }

    indexes =[ array.index(stock[0][0][0]), array.index(stock[0][0][1]) ]
   
    puts indexes.inspect

end

puts stock_picker [17,3,6,9,15,20,8,6,1,10]