class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            redirect_to signin_path
        else
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
        end
    end
    
    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    # private

    #     def login_params
    #         params.require(:sessions).permit(:name, :password)
    #     end 
end
