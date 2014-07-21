class Request < ActiveRecord::Base
  attr_accessible :organization_id, :resource, :current_resource_count, :target_resource_count, :address, :organization, :description, :start_date, :end_date, :complete, :tag_list
  has_many :contributions
  has_many :donors, through: :contributions

  validates :current_resource_count, :target_resource_count, :numericality => {:only_integer => true}
  validates :organization, :resource, :current_resource_count, :target_resource_count, :address, :description, :tag_list, presence: true
  acts_as_taggable


  def self.search(search)
    if search
      find(:all, :conditions => ['organization LIKE?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def update_count(amount_donated)
    new_amount = self.current_resource_count + amount_donated

    self.update_attributes(:current_resource_count => new_amount)

    if self.current_resource_count >= self.target_resource_count && !self.complete

      self.update_attributes(:complete => true)

    elsif self.current_resource_count >= self.target_resource_count && self.complete
      #ie if there is no need to donate anymore, do nothing
      nil
    end
  end
end