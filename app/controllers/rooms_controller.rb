class RoomsController < ApplicationController
  def index

  end

  def show
    render :show, layout: false
  end

  def room_list
    render :show, layout: false
  end
end
