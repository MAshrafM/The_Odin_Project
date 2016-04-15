class Airport < ActiveRecord::Base
  has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport_id"
  has_many :arriving_flights, class_name: "Flight", foreign_key: "destination_airport_id"
  
  validates :code, presence: true
  validates :city, presence: true
end
