class UsersController < ApplicationController
    
    def new 
        @user = User.new
    end 
    
    
    
    def create
        # if params[:user][:password] != params[:user][:password_confirmation]
        #  redirect_to new_user_path
        # else 
         @user = User.create(user_params) 
         session[:user_id] = @user.id 
         binding.pry
         redirect_to user_path(@user.id)
        #end 
    end 

    def show 
        if current_user
            @user = User.find_by_id(params[:id])
        else 
            redirect_to root_path
        end 
    end 
 
    private 

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :password_confirmation)
    end 




end
