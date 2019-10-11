require "test_helper"

describe PassengersController do
  let (:passenger) {
    Passenger.create name: "Dolly", phone_num: "360-931-1677"
  }
  describe "index" do
    it "can get the index path" do
      get passengers_path
      must_respond_with :success
    end
    
    describe "show" do
      it "can get a valid passenger" do
        get passengers_path(passenger.id)
        must_respond_with :success
      end
      
      it "will redirect for an invalid passenger" do
        get passengers_path(-1)
        must_respond_with :success
      end
    end
    
    describe "new" do
      it "can display the new passenger page" do
        get new_passenger_path
        must_respond_with :success
      end
    end
    
    describe "create" do
      it "can create a new passenger" do
        new_passenger_params = {
          passenger: {
            name: "Fido",
            phone_num: "xxx-xxx-xxxx",
          },
        }
        
        expect {
          post passengers_path, params: new_passenger_params
        }.must_change "Passenger.count", 1
        
        new_passenger = Passenger.find_by(name: new_passenger_params[:passenger][:name])
        expect(new_passenger.phone_num).must_equal new_passenger_params[:passenger][:phone_num]
        
        must_respond_with :redirect
        must_redirect_to passenger_path(new_passenger)
      end
    end
    
    describe "edit" do
      # Your tests go here
    end
    
    describe "update" do
      # Your tests go here
    end
    
    describe "destroy" do
      # Your tests go here
    end
  end
end
