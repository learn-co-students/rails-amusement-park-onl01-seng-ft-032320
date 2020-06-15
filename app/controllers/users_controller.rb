class UsersController < ApplicationController

    before_action :require_login, only: :show

    def new 
        @user = User.new
    end 

    def create
        @user =  User.create(user_params)
         if @user.save
             session[:user_id] = @user.id
            #  if @user.admin == true
            #     redirect_to new_admin_admin_path
            #  end
             redirect_to @user 
         else
             redirect_to root_path
         end
       end

       def show 
        @user = User.find_by(id: params[:id])
       end

       def ride
        @ride = Ride.new(user_id: current_user.id, attraction_id: params[:format])
        msg = @ride.take_ride
        redirect_to user_path(current_user), :alert => msg
      end

    private 

    def user_params 
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    def require_login
        redirect_to root_path unless session.include? :user_id
    end
end