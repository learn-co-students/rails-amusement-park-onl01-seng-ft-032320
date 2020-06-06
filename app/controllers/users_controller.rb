class UsersController < ApplicationController
  

  def create
    user = User.create(user_params)

  end 


  def user_params
    params.require(:user).permit(['name'], ['password_digest'], ['nausea'], ['happiness'], ['tickets'], ['height'])
  end
end
