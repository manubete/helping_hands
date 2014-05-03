class UsersController < ApplicationController
  after_save :place_user
  def index

  end

  def create
    p params
    user = User.create_and_place(params)
    user.place_user
    redirect_to root_path
  end
end

