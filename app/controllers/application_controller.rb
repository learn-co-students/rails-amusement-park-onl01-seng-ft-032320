class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

  def logged_in?
    redirect_to root_path unless !!session[:user_id]
  end

  def current_user
    user ||= User.find_by(id: session[:user_id])
  end
  

end