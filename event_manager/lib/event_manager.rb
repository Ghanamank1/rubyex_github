require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zip(zip)
    zip = zip.to_s.rjust(5,"0")[0..4]
    return zip
    
=begin #refactored this, for the code above
    if zip.nil?
        zip= nil.to_s.rjust(5, "0")
    elsif zip.length > 5 
        zip = zip[0..4]
    elsif zip.length < 5
        zip = zip.rjust(5, "0")
    else 
        zip
    end
=end 
end

def legislators_by_zipcode(zip)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
    
    begin
        civic_info.representative_info_by_address(
            address: zip,
            levels: 'country',
            roles: ['legislatorUpperBody', 'legislatorLowerBody']
        ).officials
=begin  refactored to be the code above for erb! ^
        legislators = civic_info.representative_info_by_address(
                                address: zip,
                                levels: 'country',
                                roles: ['legislatorUpperBody', 'legislatorLowerBody']
                                
        legislators = legislators.officials

        legislator_names = legislators.map {|legislators| legislators.name}

        legislators_string = legislator_names.join(", ")
=end
    rescue
        "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
    end
end

def save_thank_you_letters(id, form_letter)

    Dir.mkdir("output") unless Dir.exists?('output')

    filename = "output/thanks_#{id}.html"

    File.open(filename,'w') do |file|
        file.puts form_letter
    end
end
# proper formatting for phone number.
# has not been added into erb
# haven't done the rest yet. 
def clean_phone_number(homephone)
    phone_number = homephone.gsub(/\(|-|\s+|\)|\.|\+/, '')
    if phone_number.length < 10
        phone_number.rjust(20, '0')[0..9]
    elsif phone_number.length == 10
        phone_number
    elsif phone_number.length == 11 && phone_number[0].to_i == 1
        phone_number[1..10]
    elsif phone_number.length == 11 && phone_number[0].to_i != 1
        phone_number.rjust(10, '0')[0..9]
    elsif phone_number.length > 11
        phone_number.rjust(10,'0')[0..9]
    end         
end

puts "EventManager Initialized!"
template_letter = File.read('form_letter.erb')

file = CSV.read('event_attendees.csv', headers: true, header_converters: :symbol)

erb_template = ERB.new template_letter

file.each { |n| 
    id = n[0]
    name = n[:first_name]
    zip = n[:zipcode]
    phone_number = n[:homephone]
    phone_number = clean_phone_number(phone_number)
    puts "#{phone_number}"

    zip = clean_zip(zip)

    legislators= legislators_by_zipcode(zip)

    form_letter = erb_template.result(binding)

    save_thank_you_letters(id,form_letter)

=begin #refactored with erb
    # personal_letter = template_letter.gsub('FIRST_NAME', name)
    # personal_letter.gsub!('LEGISLATOR', legislators)

    # puts personal_letter

    # refactored with html template ^
    # puts "#{name} #{zip} #{legislators}"
=end
}


