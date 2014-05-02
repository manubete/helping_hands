class UsersController < ApplicationController

  # after_save :place_user

  def create
    p params
    user_token = params[:user_token].crypt("salt")
    User.create(user_token: user_token, lat: params[:lat], lon: params[:lon])
    redirect_to root_path
  end


  def place_user
    if Room.last.length < 7
      Room.last.users << self
    else
      Room.create()
      Room.last.users << self
    end
  end
end