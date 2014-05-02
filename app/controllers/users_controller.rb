class UsersController < ApplicationController
  def index
    @rooms = Room.all
  end
end

