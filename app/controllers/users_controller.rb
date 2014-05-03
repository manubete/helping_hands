class UsersController < ApplicationController

  def create
    p params
    user = User.create_and_place(params)
    user.place_user
    redirect_to root_path
  end



end