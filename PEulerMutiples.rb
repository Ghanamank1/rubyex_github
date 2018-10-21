number = 0
array = []

while number <999
    number = number + 1
    if (number % 3 == 0) || (number % 5 == 0)
        array.push(number)
    end
end

puts array.inspect
newArray = array.select { |i| i % 2 == 0}
puts newArray.inspect

