class RidesController < ApplicationController

    def create
        @ride = Ride.create(attraction_id: params[:id], user_id: current_user.id)
        flash[:alert] = @ride.take_ride
        redirect_to user_path(current_user)
    end
end