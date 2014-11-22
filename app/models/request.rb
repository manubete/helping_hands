class Request < ActiveRecord::Base
  attr_accessible :organization_id, :resource, :current_resource_count, :target_resource_count, :address, :organization, :description, :start_date, :end_date, :complete, :tag_list

  has_many :contributions
  has_many :donors, through: :contributions

  validates :current_resource_count, :target_resource_count,
            :numericality => {:only_integer => true}
  validates :organization, :resource, :current_resource_count,
            :target_resource_count, :address, :description, :tag_list,
            :start_date, presence: true
  validate :start_date_valid?
  validate :end_date_valid?
  acts_as_taggable

  def start_date_valid?
    if !start_date.nil? && !start_date.between?(Date.today, Date.today + 1.month)
      errors.add :start_date, "Date posted must within a month from today."
    end
  end

  def end_date_valid?
    if !end_date.nil? && end_date < start_date
      errors.add :end_date, "Need by date must be after date posted."
    end
  end

  def self.search(search)
    if search
      search.downcase!
      find(:all,
           :conditions => ['lower(organization) LIKE? OR lower(resource) LIKE? OR lower(address) LIKE? OR lower(description) LIKE?',
                           "%#{search}%",
                           "%#{search}%",
                           "%#{search}%",
                           "%#{search}%"])

    else
      find(:all)
    end
  end

  def update_count(amount_donated)
    new_amount = self.current_resource_count + amount_donated

    self.update_attribute(:current_resource_count, new_amount)

    if self.current_resource_count >= self.target_resource_count && !self.complete

      self.update_attribute(:complete, true)

    elsif self.current_resource_count >= self.target_resource_count && self.complete
      #ie if there is no need to donate anymore, do nothing
      nil
    end
  end
end
