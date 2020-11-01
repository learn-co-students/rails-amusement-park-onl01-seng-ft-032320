class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end


  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id]) if logged_in?
    end
  end
end
