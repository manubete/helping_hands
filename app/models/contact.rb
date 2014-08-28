class Contact < ActiveRecord::Base
  attr_accessible :description, :email, :name
end
