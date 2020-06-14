class RidesController < ApplicationController

    def create
        if current_user 
            @ride = Ride.create(ride_params)
            @user = User.find_by_id(params[:ride][:user_id])
            message = @ride.take_ride 
            flash[:notice] = message
            redirect_to user_path(@user.id)
            
        else 
            redirect_to root_path
        end 
    end 


    private 

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end 

end
