class Request < ActiveRecord::Base
  attr_accessible :organization, :resource, :resource_count, :address, :description, :purpose

  validates :resource_count, :numericality => {:only_integer => true}
  validates :organization, :resource, :resource_count, :address, :description, :purpose, presence: true


  def self.search(search)
    if search
      find(:all, :conditions => ['organization LIKE?', "%#{search}%"])
    else
      find(:all)
    end
  end
end