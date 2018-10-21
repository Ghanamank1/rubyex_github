number = 1
array = []

while number < 130
    number = number + 1
    
    array.push(number)

    array.each do |i|
        prime= ( i % number == 1)
        puts prime
    end
end

puts array.inspect
