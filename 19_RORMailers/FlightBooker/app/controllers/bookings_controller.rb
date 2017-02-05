class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
	@passengers = params[:passengers].to_i
	@booking = Booking.new
	@passengers.times{@booking.passengers.build}
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
	if @booking.save
	  #mail the passengers
    PassengerMailer.thank_you(@booking).deliver_later
	  redirect_to booking_path(@booking)
	  flash[:success] = "Flight has been booked! thanks for using our service"
	else
	  @flight = Flight.find(params[:flight_id])
	  render 'new'
	end
  end
  
  private
    def booking_params
	  params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
	end
end
