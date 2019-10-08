class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end
   
  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  def new
    @trip = Trip.new
  end 

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
      return
    else
      render :new
      return
    end
  end 

  private

  def trip_params
    return params.require(:trip).permit(:date, :rating, :cost, :passenger_id, :driver_id)
  end

end
