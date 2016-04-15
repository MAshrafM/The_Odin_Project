class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :destination_airport_id
      t.date :departure_date
      t.time :departure_time
      t.integer :flight_duration

      t.timestamps null: false
    end
  end
end
