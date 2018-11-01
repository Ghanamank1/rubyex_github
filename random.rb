puts Dir::pwd
puts gets 
puts gets
puts gets
puts gets
puts gets 
puts 
puts 
puts 
puts
# puts readlines.inspect

puts "Checking out the function"
array = []
array.push(File.open("oliver.txt").read)
puts array.count
puts oliver = File.open("oliver.txt", 'r+')
puts oliver.gets
puts oliver.pos
oliver.pos = 0
puts oliver.gets(1000)
puts oliver.gets
puts oliver.pos
puts oliver.puts 'THIS IS A TEST'
puts oliver.gets
puts oliver.gets
puts oliver.gets
puts oliver.gets
puts oliver.gets
puts oliver.gets
# puts oliver.read(1000)
# oliver.each_byte {|n| puts n}
oliver.eof
puts oliver.pos
puts oliver.gets
puts oliver.seek(-7, IO::SEEK_END)
puts oliver.pos
puts oliver.gets
puts 
puts File.read('oliver.txt')