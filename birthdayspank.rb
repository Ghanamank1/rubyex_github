# trying to add in word input, but not working right now...

def monthNumber word
    month = [
        "january", "february", "march", "april",
        "may", "june", "july", "august", "september",
        "october", "november", "december"
    ]

    date = 

    if word = word.to_s
        word = word.downcase 
        date = month.index(word) 
    end 
    word = word.to_i
    if  word = word.to_i
        date = word 
    end
    date 
end

#what year
puts "What year were you born?"
year = gets.chomp.to_i
#what month
puts "What month were you born?"
month = monthNumber gets.chomp
#what day 
puts "Now what day were you born?"
day = gets.chomp.to_i
#figure out age now
age = Time.new - Time.mktime(year,month,day)
integerAge = (age/60/60/24/365).to_i.to_s
puts integerAge
#spank for each birthday they've had 
integerAge.to_i.times do 
    puts "SPANK!"
end