class Donor < ActiveRecord::Base
  attr_accessible :name, :city, :phone_number, :email, :username, :password


end