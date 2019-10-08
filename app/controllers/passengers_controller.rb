class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end
  
  def show
    passenger_id = params[:id]
    @passenger = Passenger.find_by(id: passenger_id)
  end

  def new
    @passenger = Passenger.new
  end 

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passenger_path(@passenger)
      return
    else
      render :new
      return
    end
  end 

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end