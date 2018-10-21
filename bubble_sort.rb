def bubble_sort array
    puts array.inspect
   (array.length-1).times do
    for n in 0..(array.length-1)
        if (array[n] <=> array[n+1] ) == 1
        
            array[n],array[n+1] = array[n+1], array[n]
        end
    end
end

    array.inspect
end

# puts bubble_sort [1,2,5,1,1,6,5,4,3,2,1]

def random arr
        
        for number in 0..(arr.length - 1)
            yield(arr[number], arr[number+ 1])
        end
end
random([1,2,3,4,5,5]) {|first, second| puts "#{first} , #{second.to_s}" }

def bubble_sort_by array
    
    puts array.inspect
    (array.length-1).times do
        for n in 0..(array.length-1)
            if yield(array[n], array[n+1] ) > 0
            
                array[n],array[n+1] = array[n+1], array[n]
            end
        end
    end

   array.delete(nil)
   puts array.inspect
end

bubble_sort_by(["hi","hello","hey", "heyyyy", "h"]) do |left,right|
      left.to_s.length - right.to_s.length
end

bubble_sort_by ["hello", "h", "mama", "lolo", "de"] do |left, right| 
    left.to_s.length - right.to_s.length
end