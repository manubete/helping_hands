class User < ActiveRecord::Base
  attr_accessible :user_token, :lat, :lon
end