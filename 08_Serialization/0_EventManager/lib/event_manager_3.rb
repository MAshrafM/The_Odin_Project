# lib/event_manager_3.rb
require 'csv'
require 'sunlight/congress'
Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

puts "EventManager initialized."
contents = CSV.open "../event_attendees.csv", headers: true, header_converters: :symbol

=begin
### Using SunLight API

# collecting Legislator names
legislator_names = []
legislators.each do |legislator|
  legislator_name = "#{legislator.first_name} #{legislator.last_name}"
  legislator_names.push legislator_name
end





contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
  legislator_names = legislators.collect do |legislator|
  "#{legislator.first_name} #{legislator.last_name}"
   end

  puts "#{name} #{zipcode} #{legislator_names}"
end

# celan
contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)

  legislator_names = legislators.collect do |legislator|
    "#{legislator.first_name} #{legislator.last_name}"
  end

  legislators_string = legislator_names.join(", ")

  puts "#{name} #{zipcode} #{legislators_string}"
end
=end
# Moving to Method

def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)

  legislator_names = legislators.collect do |legislator|
    "#{legislator.first_name} #{legislator.last_name}"
  end

  legislator_names.join(", ")
end

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  puts "#{name} #{zipcode} #{legislators}"
end
