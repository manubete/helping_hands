class Contribution < ActiveRecord::Base
  mount_uploader :photo, AvatarUploader

  attr_accessible :donor_id, :request_id, :resource_amount, :photo
  belongs_to :donor
  belongs_to :request

  validates :resource_amount, presence: true
  validates :resource_amount, numericality: true

end
