module Enumerable
    def my_each
        result = []
        for index in 0..(self.length - 1)
            yield( self[index] )
            result.push( self[index] )
        end
        result
    end
    def my_each_with_index
        result = []
        for index in 0..(self.length - 1)
            yield( self[index], self.index( self[index] ) )
            result.push( self[index] )
        end
        result
    end
    def my_select 
        result = []
        for index in 0..(self.length - 1)
            
            if yield( self[index] ) == true
            result.push( self[index] )
            end
        end
        result
    end
    def my_all?
        result = []
        for index in 0..(self.length - 1)
            if (yield( self[index] ) == true )
                result.push(true)          
            end
        end
            if result.length == self.length
            return true
        else 
            return false
        end 
    end
    def my_any?
        result = []
        for index in 0..(self.length - 1)
            if (yield( self[index] ) == true )
                return true
            else 
                return false
            end
        end
    end
    def my_none?
        result = []
        for index in 0..(self.length - 1)
            if (yield( self[index] ) == false )
                result.push(false)          
            end
        end
        if result.length == self.length
            return true
        else 
            return false
        end 
    end
    def my_count
        result = []
        for index in 0..(self.length - 1)
            if (yield( self[index] ) == true )
                result.push(true)          
            end
        end
        result.length.inspect
    end
    def my_map proc=nil
        result = []
        for index in 0..(self.length - 1)
            if proc
                
                result.push( proc.call( self[index] ) )
            else
                yield( self[index] )
                result.push( yield( self[index] ) )
            end
        end
        result
    end
    
    def my_inject number=nil
        
        if number == nil
            number = self[0]
        end
        for index in 1..(self.length - 1)
            
            yield( number, self[index] )

            number =  yield( number, self[index] )  
        end
        number
    end
end
=begin
def multiply_els array

    array.my_inject {|n,m| m*n}

end

array = [7,4,5,4,6,6,8]
arr= array.my_map { |n| n*2 }
puts arr.inspect
puts "all number multiplied equals!"

puts multiply_els [2,4,5]
=end

# puts [1,2,3,4].my_select {|n| n>2}