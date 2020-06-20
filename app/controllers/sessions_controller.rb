class SessionsController < ApplicationController
  def new
     @user = User.new
  end

  def create
     if user = User.find_by(id: user_params[:name])
        if user.authenticate(params[:password])
           session[:user_id] = user.id
           redirect_to user
        else
           render :new 
        end
     end
  end

  def destroy
     session.delete :user_id
     redirect_to root_path
  end
end 