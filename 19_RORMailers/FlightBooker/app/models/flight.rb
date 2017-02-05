class Flight < ActiveRecord::Base
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :destination_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :passenger_bookings
  
  validates :departure_airport_id, presence: true
  validates :destination_airport_id, presence: true
  validates :flight_duration, presence: true
  validates :departure_date, presence: true
  
  def self.list
	dates = Flight.all.order(departure_date: :asc)
	dates.map {|d| d.departure_date.strftime("%d/%m/%Y")}.uniq
  end

  def self.search(depart, arrive, date)
	Flight.where(departure_airport_id:depart, destination_airport_id: arrive, departure_date: date)
  end
end
