# lib/event_manager_1.rb

require "csv"
puts "EventManager initialized"
=begin
### Parsing with CSV
# start working with csv library
contents = CSV.open "../event_attendees.csv", headers: true
contents.each do |row|
  name = row[2]
  puts name
end

# accessing columns by their names
contents = CSV.open "../event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  puts name
end
=end

#displaying zip codes with the name
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  puts "#{name} : #{zipcode}"
end