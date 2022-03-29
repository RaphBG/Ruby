require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
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
    rescue
      'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end
  end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir("../output") unless Dir.exists?("../output")

  filename = "../output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_number(phone_number)
  phone_number.gsub!(".",'')
  phone_number.gsub!(")",'')
  phone_number.gsub!("(",'')
  phone_number.gsub!("-",'')
  phone_number.gsub!(" ",'')
  if phone_number.length==10
    phone_number
  elsif phone_number.length == 11 && phone_number[0] == "1"
    phone_number[1..10]
  else
    "Wrong Number!!"
  end
end

def peak(array)
  array.max_by {|a| array.count(a)}
end

puts "EventManager initialized."

file = CSV.open '../event_attendees.csv', headers: true, header_converters: :symbol
file_size = CSV.read('../event_attendees.csv').length
template_letter = File.read "../form_letter.erb"
erb_template = ERB.new template_letter
hours = Array.new(file_size)
days = Array.new(file_size)

file.each_with_index do |row, index|
  
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  reg_date = row[:regdate]
  phone_number = clean_phone_number(row[:homephone])
  puts "#{name} #{reg_date} #{phone_number}"
  date = DateTime.strptime(reg_date,"%m/%d/%y %H:%M")
  hours[index] = date.hour
  days[index] = date.wday

  form_letter = erb_template.result(binding)
  save_thank_you_letter(id,form_letter)
end

puts "Peak registration hour is #{peak(hours)}."
puts "Peak registration day is #{Date::DAYNAMES[peak(days)]}."
