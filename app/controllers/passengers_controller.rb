class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end
  
  def show
  end
end
