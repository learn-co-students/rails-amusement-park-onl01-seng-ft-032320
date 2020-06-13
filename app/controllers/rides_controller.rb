class RidesController < ApplicationController
  # before_action :verified

  def create
    @ride = Ride.create(ride_params)
    redirect_to user_path(current_user), alert: "#{@ride.take_ride}"
  end 

  private 

  def ride_params 
    params.permit(:user_id, :attraction_id)
  end 

end 