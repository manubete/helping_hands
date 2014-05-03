class User < ActiveRecord::Base
  belongs_to :rooms
  attr_accessible :user_token, :lat, :lon, :name

  def self.create_and_place(params)
    user_token = params[:user_token].crypt("salt")
    user = User.new(user_token: user_token, lat: params[:lat], lon: params[:lon])
    user.save
    return user
  end

  def place_user
    if Room.last.users.length < 7
      Room.last.users << self
    else
      Room.create()
      Room.last.users << self
    end
  end
end

