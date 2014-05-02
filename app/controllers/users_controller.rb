class UsersController < ApplicationController
  after_save :place_user

  def index
    @rooms = Room.all
  end

  def create
    username = params[:username].crypt("salt")
    User.create(name: username)
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
