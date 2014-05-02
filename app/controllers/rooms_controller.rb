class RoomsController < ApplicationController
  def index

  end

  def show
    @room = Room.find(params[:id])
  end

  def room_list
    render :show, layout: false
  end
end

