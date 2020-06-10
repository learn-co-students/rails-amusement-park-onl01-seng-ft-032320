class RidesController < ApplicationController 

    def create 
        # binding.pry

        ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
        flash[:alert] = ride.take_ride
        # if rejection != "Sorry."
        #     flash[:alert] = rejection
        # end
        # binding.pry
        redirect_to current_user
    end


end