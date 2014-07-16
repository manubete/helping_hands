class Organization < ActiveRecord::Base
  attr_accessible :name, :city, :address, :operation_days, :operation_hours, :phone_number, :email, :website_url, :linked_in_url, :facebook_url, :username, :password, :password_confirmation

  has_many :requests

  validates :password, confirmation: true
  validates :name, :city, :address,:operation_days, :operation_hours, :phone_number, :website_url, :username, :password, :email, presence: true
  validates :name, :address,:operation_days, :operation_hours, :phone_number, :website_url, :username, :password, :email, uniqueness: true


  def self.authenticate(email, password)
    @organization = Organization.find_by_email(email)
    if @organization && @organization.password == password
      p "#{email} #{password} #{@organization}"
      @organization
    else
      nil
    end
  end

end