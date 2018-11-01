require 'csv'


CSV.open('csv.txt').each {|person| p person}

people =  CSV.read('csv.txt')

puts people[0][0]
puts people[1][0]
puts people[2][0]

laura = people.find {|person| person[0] =~ /Laura/}
p laura

young_people = people.find_all {|young| young[3].to_i.between?(20,40)}

p young_people

# NOTE: this changes the value in the original csv people array
# it goes not only change the new laura array because its part 
# of the CSV library in ruby 


laura[0] = 'Lauren Smith'

p laura

p people


CSV.open('csv.txt', 'w') do |csv| 
    people.each {|person|
        csv << person
    }
end

