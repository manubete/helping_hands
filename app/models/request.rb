class Request < ActiveRecord::Base
  attr_accessible :organization, :resource, :resource_count, :address, :description, :purpose
end