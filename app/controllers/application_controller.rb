class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :go_home
  helper_method :current_user

  
  
  
  private
  
    def go_home
      redirect_to root_path unless verified
    end

    def verified
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id]) 
    end
 
end
