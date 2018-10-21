number = 1
array = [1,2]

while array.sum < 4000000
    number = number + 1
    
    array[number] =  array[number-1] + array[number-2] 

    array.push(array[number])
    array.pop
end

puts array.inspect
newArray = array.select { |i| i % 2 == 0}
puts newArray.inspect
puts newArray.sum
