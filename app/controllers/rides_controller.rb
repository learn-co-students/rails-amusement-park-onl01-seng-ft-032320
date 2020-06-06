class RidesController < ApplicationController
    before_action :require_login
  
    def create
      ride = Ride.find_or_create_by(user_id: current_user.id, attraction_id: params[:attraction_id])
      
      flash[:alert] = ride.take_ride
      redirect_to user_path(ride.user)    
    end
  end