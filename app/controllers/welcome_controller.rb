class WelcomeController < ApplicationController

    def home 
    end

    def signin
        if session[:user_id]
            redirect_to root_url
        end
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        # binding.pry
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end