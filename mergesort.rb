
# INCOMPLETE!! 
# NEED TO TAKE MORE TIME IN UNDERSTANDING RECURSION
def mergesort(array)
    sorted = []
    if array.length < 2
        return array
    else
        first = mergesort(array.slice!(0..(array.length-1)/2))
        second = mergesort(array)
        puts first.inspect
        puts second.inspect
        if first[0] < second[0] 
            sorted + first + second
            return sorted
        else
            sorted + second + first
            return sorted
        end
    end
end

#divide array
#sort left
#sort right
#merge 

puts 'sorted'
puts mergesort([5,2])
     mergesort(5)
     mergesort(2)
     then merge(2) + merge(5)

    
     mergesort(5,4,3)
     mergesort(5,4)
     mergesort(5)
     mergesort(4)
     then merge(4) + merge(5)
     mergesort(3)
     then merge(3) + [ merge(4) + merge(5) ]
    


    mergesort(3,10,1,4)
    mergesort(3,10) - merge(1,4)paused
    mergesort(3)
    mergesort(10)
    then merge(3) + merge(10)
    mergesort(1,4)
    mergesort(1)
    mergesort(4)
    then merge(1) + merge(4)
    then merge(1) + merge(3) + merge(4) + merge(10) 


     mergesort(4,3)
     mergesort([5,2])
     mergesort(2)
     mergesort (5)
mergesort(2 , mergesort(5)) 
#mergesort 

#start 4,5,6,7,8,8,9,0

#half  4,5,6,7   8,8,9,0

#half  4,5  6,7    8,8   9,0

#half  4  5  6  7  8  8   9  0