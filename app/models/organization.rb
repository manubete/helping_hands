class Organization < ActiveRecord::Base
  attr_accessible :name, :city, :phone_number, :email, :website_url, :linked_in_url, :facebook_url, :username, :password


end