class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        # binding.pry 
     @user = User.new(user_params)
     if @user.save
        session[:user_id] = @user.id
        redirect_to @user
     else
        render :new
     end
    end
    
    def show
        redirect_to root_path unless session.include? :user_id
        @user = User.find_by(id: params[:id])
    end
    
    private
    
        def user_params
            params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
        end
        
end
