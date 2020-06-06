class UsersController < ApplicationController
  before_action :require_login, :except => [:index, :new, :create]

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
      @user = User.find_by(:id => params[:id])
      unless @user = current_user 
        redirect_to root_path
      end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :mood, :happiness, :height, :nausea, :tickets, :password, :admin)
  end

  
  
end
