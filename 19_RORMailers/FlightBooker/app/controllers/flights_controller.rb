class FlightsController < ApplicationController
  def index
	@airports = Airport.all.map{|air| [air.code, air.id]}
	@dates = Flight.list
	@departure_airport = params[:departure_airport_id]
	@destination_airport = params[:destination_airport_id]
	@depart_date = Date.parse(params[:departure_date]) if params[:departure_date]
	@passenger_options = [1,2,3,4]
	@passengers = params[:passengers]
	@flights = Flight.search(@departure_airport, @destination_airport, @depart_date)
	#@flights = Flight.all
	
	if params[:commit] == "Search"
		if @departure_airport == @destination_airport
			flash[:danger] = "Departure and Destination can't be the same."
		end
	end
  end
end
