# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

airports = {
			"LON" => "London",
			"NYC" => "NewYork",
			"LAX" => "California",
			"CAI" => "Cairo",
			"HND" => "Tokyo",
			"SVO" => "Moscow",
			"CPT" => "CapeTown"
			}
airports.each do |code, city|
	Airport.create(code: code, city: city)
end

dates = []
6.times do
	dates << Faker::Date.forward(7)
end

def rand_time(date)
	t = Faker::Time.between(date.beginning_of_day, date.end_of_day, :day)
	return t
end

depart_id = 1
arrive_id = 1

7.times do 
	dates.each do |date|
		if arrive_id == depart_id
		  arrive_id = arrive_id + 1 
		end
		Flight.create(departure_airport_id: depart_id, destination_airport_id: arrive_id, departure_date: rand_time(date), flight_duration: rand(5..50))
		arrive_id = arrive_id + 1 
	end
	depart_id = depart_id + 1 
	arrive_id = 1
end