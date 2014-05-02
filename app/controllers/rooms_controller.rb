class RoomsController < ApplicationController
  def index

  end

  # one of these render is not right. Find bug
  def show
    render :show, layout: false
  end

  def room_list
    render :show, layout: false
  end
end

