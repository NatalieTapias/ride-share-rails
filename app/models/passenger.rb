class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify
  
  validates :name, presence: true
  validates :phone_num, presence: true
  
  
  def total_cost
    sum = 0
    self.trips.each do |trip|
      if trip.cost != nil
        sum += trip.cost 
      end
    end
    return sum
  end

  def add_trip
    if Driver.available_driver != nil
      trip_hash = {
        date: Date.today,
        passenger_id: self.id,
        driver_id: Driver.available_driver.id,
        cost: rand(1..999), 
        rating: nil
      }
      new_trip = Trip.create(trip_hash)
      Driver.available_driver.active = true
      return new_trip
    else
      return "There is no available driver"
    end
  end
end
