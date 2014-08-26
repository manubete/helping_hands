class Contribution < ActiveRecord::Base
  mount_uploader :photo, AvatarUploader

  attr_accessible :donor_id, :request_id, :resource_amount, :photo, :tax_form_flag, :contribution_date, :pickup, :pickup_start_date, :pickup_end_date, :pickup_start_time, :pickup_end_time, :pickup_number, :pickupAddress
  belongs_to :donor
  belongs_to :request

  validates :resource_amount, presence: true
  validates :resource_amount, numericality: true

end
