class Request < ActiveRecord::Base
  attr_accessible :organization_id, :resource, :resource_count, :address, :organization, :description, :complete

  def self.search(search)
    if search
      find(:all, :conditions => ['organization LIKE?', "%#{search}%"])
    else
      find(:all)
    end
  end
end