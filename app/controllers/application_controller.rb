class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home 

  end


  
  def current_user 
    @user = User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
  
  helper_method :current_user
end
