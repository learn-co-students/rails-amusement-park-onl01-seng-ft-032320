class UsersController < ApplicationController 
    
    def show 
        redirect_to root_url unless logged_in?
        @user = current_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user 
        else 
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
    end
end