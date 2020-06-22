class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]  

  def new 
    @user = User.new
  end 
  
  def create
    user = User.create(user_params)
    
    if user.save 
      session[:user_id] = user.id  
      redirect_to user
    end
  end 
  
  def show
    @user = User.find_by(id: session[:user_id]) 
  end

  
end
