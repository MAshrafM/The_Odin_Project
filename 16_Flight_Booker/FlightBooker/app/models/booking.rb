class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passenger_bookings
  has_many :passengers, through: :passenger_bookings
  
  validates :flight_id, presence: true
  
  accepts_nested_attributes_for :passengers

end
