words = ''

lines = []

while words != " "
 words = gets.chomp.to_s
 lines.push words

puts lines.sort
puts "there are " + lines.length.to_s + " elements now"

end 