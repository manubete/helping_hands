class RoomsController < ApplicationController
  def index
  end

  #shouldn't be same route as show and room_list. Fix bug/route.
  def show
    render :show, layout: false
  end

  def room_list
    render :show, layout: false
  end
end

