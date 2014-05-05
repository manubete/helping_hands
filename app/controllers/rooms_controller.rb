class RoomsController < ApplicationController
  def index
<<<<<<< HEAD
  end

  #shouldn't be same route as show and room_list. Fix bug/route.
=======

  end

>>>>>>> User can see roomlist and click on individual rooms. User can post messages.
  def show
    render :show, layout: false
  end

  def room_list
    render :show, layout: false
  end
end

