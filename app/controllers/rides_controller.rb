class RidesController < ApplicationController

    def create
        @ride = Ride.create(:user_id => current_user.id, :attraction_id => params[:id])
        @message = @ride.take_ride
        redirect_to user_path(current_user), :flash => {:notice => @message }
    end 

end 