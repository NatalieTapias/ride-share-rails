require "test_helper"

describe DriversController do
  
  describe "index action" do
    let (:driver) {
      Driver.create name: "George", vin: "123456789"
    }
    
    it "responds with success when there are many drivers in the database" do
      driver
      
      get drivers_path
      
      must_respond_with :success
    end
    
    it "responds with success when there are no drivers in the database" do
      driver.destroy
      
      get drivers_path
      
      must_respond_with :success
    end
  end
  
  
  describe "show action" do
    let (:driver) {
      Driver.create name: "Wallis", vin: "987654321"
    }
    
    it "responds with success when showing an existing valid driver" do
      get driver_path(driver.id)
      
      must_respond_with :success
    end
    
    it "responds with 404 with an invalid driver id" do
      
      get driver_path(-1)
      
      must_respond_with :missing
    end
  end
  
  
  describe "new action" do
    
    it "responds with success" do
      get new_driver_path
      
      must_respond_with :success
    end
  end
  
  describe "create action" do
    it "can create a new driver with valid information accurately, and redirect" do
      driver_hash = {
        driver: {
          name: "SpongeBob", 
          vin: "1234567890"
        }
      }
      
      expect {
        post drivers_path, params: driver_hash
      }.must_differ 'Driver.count', 1
      
      must_redirect_to driver_path(Driver.find_by(name: "SpongeBob"))
    end
  end
  
  describe "edit action" do
    let (:driver) {
      Driver.create name: "Patrick Star", vin: "9876543210"
    }
    
    it "responds with success when getting the edit page for an existing, valid driver" do
      get edit_driver_path(driver)
      
      must_respond_with :success
    end
    
    it "responds with redirect when getting the edit page for a non-existing driver" do
      get edit_driver_path(-1)
      
      must_respond_with :redirect
    end
  end
  
  describe "update" do
    let (:driver) {
      Driver.create name: "Sammy Sam", vin: "235320"
    }
    
    it "can update an existing driver with valid information accurately, and redirect" do
      existing_driver = Driver.first
      updated_driver_form_data = {
        driver: {
          name: "Spammy Spam",
          vin: "000000"
        }
      }
      
      expect {
        patch driver_path(existing_driver.id), params: updated_driver_form_data
      }.wont_change 'Driver.count'
      
      expect (
        Driver.find_by(id: existing_driver.id).name
      ).must_equal "Spammy Spam"
      
      expect (
        Driver.find_by(id: existing_driver.id).vin
      ).must_equal "000000"
      
      must_respond_with :redirect
    end

    it "does not update any driver if given an invalid id, and responds with a 404" do
      updated_driver_form_data = {
        driver: {
          name: "Spammy Spam",
          vin: "000000"
        }
      }

      expect {
        patch driver_path(-1), params: updated_driver_form_data
      }.wont_change 'Driver.count'

      must_respond_with :missing
    end
  end

  # describe "destroy" do
  #   it "destroys the driver instance in db when driver exists, then redirects" do
  #     # Arrange
  #     # Ensure there is an existing driver saved

  #     # Act-Assert
  #     # Ensure that there is a change of -1 in Driver.count

  #     # Assert
  #     # Check that the controller redirects

  #   end

  #   it "does not change the db when the driver does not exist, then responds with " do
  #     # Arrange
  #     # Ensure there is an invalid id that points to no driver

  #     # Act-Assert
  #     # Ensure that there is no change in Driver.count

  #     # Assert
  #     # Check that the controller responds or redirects with whatever your group decides

  #   end
  # end
end

