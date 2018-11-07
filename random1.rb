def append(ary, n)

    return ary.push(0)               if n == 0
    ary.push(n) + append([], n-1)

end

#ary.push(0)       if n==0 => [0]
#ary.push(1,0)     if n ==1 ==> [1,0]
#ary.push(2,1,0)   if n ==2 ==> [2,1,0]
#ary.push(3,2,1,0) if  n == 3 ==> [3,2,1,0]


def reverse_append(ary, n)

    return []             if n < 0
    
    ary << 0
    ary << 1
    ary << 2
    append([], n-1)
    
end

#reverse_append [], -1  => []
#reverse_append [], 0   => [0]
#reverse_append [], 1  => [0,1]
#reverse_append [], 2  => [0,1,2]
#reverse_append [], 3  => [0,1,2,3]

def reverse_append1(ary, n)
    
    0.upto(n) {|n| ary.push(n)}
    ary
end


def flatten(arr)
    if arr.length == 0
        []
    elsif arr.length > 0
        if arr[0].length > 0

            flatten(arr[0])
        else
            array = []
            array << arr[0]
            array << arr[1]
            array
        end
    end
end

def collatz(n)
    if n == 1
        return n
    elsif n % 2 == 0
        return 1 + collatz(n/2)
    elsif n % 2 != 0
       return 1 + collatz(3*n + 1)
    end
end

puts collatz(1111)
