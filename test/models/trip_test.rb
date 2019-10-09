require "../test_helper"

describe Trip do
  let (:new_trip) {
    Trip.new(
      date: Date.today,
      rating: , 
      cost: nil, 
      passenger_id: 1,
      driver_id: 1
    )
  }
  it "can be instantiated" do
    # Assert
    expect(new_trip.valid?).must_equal true
  end

  it "will have the required fields" do
    # Arrange
    new_trip.save
    trip = Trip.first
    [:date, :rating, :cost, :passenger_id, :driver_id].each do |field|

      # Assert
      expect(trip).must_respond_to field
    end
  end

  describe "relationships" do
    it "can have one passenger" do
      # Arrange
      new_trip.save
      trip = Trip.first

      # Assert
      expect(trip.passengers.count).must_be :>, 0
      trip.passengers.each do |trip|
        expect(passengers).must_be_instance_of Passenger
      end
    end
  end

  describe "validations" do
    # Your tests go here
  end

  # Tests for methods you create should go here
  describe "custom methods" do
    # Your tests here
  end
end
