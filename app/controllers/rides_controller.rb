class RidesController < ApplicationController

    def create
        # binding.pry
        @user = User.find_by(id: params[:rides][:user_id])
        @ride = Ride.create(ride_params)
        flash[:alert] = @ride.take_ride
        redirect_to user_path(@user)
    end

    private

    def ride_params
        params.require(:rides).permit(:user_id, :attraction_id)
    end
end
