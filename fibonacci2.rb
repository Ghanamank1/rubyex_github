#1,2,3,5,8,13,21,34,55
#fib(1) => 1
#fib(4) => 1,2,3,5
#fib(9)=> 1,2,3,5,8,13,21,34,55

def fibs(number)
    array = []

    0.upto(number-1) {|n| 
        if n == 0 
        array[n] = n + 1
        elsif n == 1
            array[n] = n+1
        else
        array[n] = array[n-1] + array[n-2]
        end
    }

    array.inspect
end

def fibs_rec(number)
    array = []
    if number == 1

        array[number] = number
       # array << 1
   # elsif number == 2
    #    puts array.inspect

     #   array[number] = number
       # array << 1
       # array << 2
    elsif number > 2
     #   array << 1
     #   array << 2
     #   array << (array[-2] + array[-1])
     #   array << (array[-2] + array[-1])
     #   array << (array[-2] + array[-1])
     #   array << (array[-2] + array[-1])
     #   array << (array[-2] + array[-1])
     #   array << (array[-2] + array[-1])
     #   array << (array[-2] + array[-1])
     #array[number] = fibs_rec(number-1) + fibs_rec(number-2)
        array[number] = (number-1) + (number-2)
        fibs_rec(number-1)
        puts array.inspect
        #puts array[0..number-1].inspect
       # fibs_rec(number-1) + fibs_rec(number-2)
    end
end
# puts fibs(4)
puts fibs_rec(5)