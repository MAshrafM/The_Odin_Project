class PassengerMailer < ApplicationMailer

  def thank_you(booking)
    @booking = booking
    @passenger = booking.passengers.first
    mail(to: @passenger.email, subject: "Thank you for using FlightBooker")
  end
end
