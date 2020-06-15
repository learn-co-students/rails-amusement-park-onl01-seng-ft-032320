class SessionsController < ApplicationController

    def new 
    end 

    def create 
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            redirect_to signin_path
            # session[:user_id] = @user.id
            # redirect_to welcome_path
        else
            session[:user_id] = @user.id
            redirect_to @user
            #redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id  
        redirect_to root_path
    end
end
