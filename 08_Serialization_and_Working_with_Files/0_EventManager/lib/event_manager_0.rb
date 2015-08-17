# lib/event_manager_0.rb

puts "EventManager initialized"

=begin
### Loading A File

#read the entire doc
contents = File.read "../event_attendees.csv"
puts content

#read the entire doc line by line
lines = File.readlines "../event_attendees.csv"
lines.each do |line|
  puts line
end

# split doc to col
lines = File.readlines "../event_attendees.csv"
lines.each do |line|
  columns = line.split(",")
  puts columns
end

# only the first name in the doc
lines = File.readlines "../event_attendees.csv"
lines.each do |line|
  columns = line.split(",")
  name = columns[2]
  puts name
end
=end
# skip header data
lines = File.readlines "../event_attendees.csv"
lines.each_with_index do |line, index|
  next if index == 0
  columns = line.split(",")
  name = columns[2]
  puts name
end
