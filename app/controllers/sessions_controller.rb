class SessionsController < ApplicationController

    def new
        @user = User.new
    end
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
         redirect_to signin_path            #this should be in the else
        else
            session[:user_id] = @user.id            #this should be in the 'if'
            redirect_to @user                        #this should be in the 'if'           
        end
    end
    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end
