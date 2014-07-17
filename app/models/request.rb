class Request < ActiveRecord::Base
  attr_accessible :organization_id, :resource, :resource_count, :address, :organization, :description, :start_date, :end_date, :complete, :tag_list
  has_many :contributions
  has_many :donors, through: :contributions

  validates :resource_count, :numericality => {:only_integer => true}
  validates :organization, :resource, :resource_count, :address, :description, :tag_list, presence: true
  acts_as_taggable


  def self.search(search)
    if search
      find(:all, :conditions => ['organization LIKE?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def update_count(amount_donated)
    new_amount = self.resource_count - amount_donated
    if new_amount == 0
      self.update_attributes(:resource_count => new_amount)
      self.update_attributes(:complete => true)
    elsif new_amount < 0
      #ie if there is no need to donate anymore, do nothing
      nil
    else
      self.update_attributes(:resource_count => new_amount)
    end
  end
end