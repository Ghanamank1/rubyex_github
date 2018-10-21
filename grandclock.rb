# takes a block 
# call block once every hour 
# include (do puts 'DONG' end) so it chimes 

# so time + 3600?? 
# Time.now.hour get the current hour in 24 hour time clock

def time proc
    hours = Time.new.hour
    
    hours.times do
        proc.call 
    end 
end 

dingDong = Proc.new do 
    puts 'DONG'
end

time dingDong

puts Time.new.hour

