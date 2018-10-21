#number = 0
#array = []

#while number <999
#    number = number + 1
#    if (number % 3 == 0) || (number % 5 == 0)
#        array.push(number)
#    end
#end

#puts array.inspect
#puts array.sum



result = 1
[1,2,3,4].each do |i|
    if i!= 0
        result = result*i
    else
        result
    end
end

puts result
