class Contribution < ActiveRecord::Base
  attr_accessible :donor_id, :request_id, :resource_amount
  belongs_to :donor
  belongs_to :request

end