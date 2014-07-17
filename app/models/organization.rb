class Organization < ActiveRecord::Base
  attr_accessible :name, :description, :city, :address, :operation_days, :opening_time, :closing_time, :phone_number, :email, :website_url, :linked_in_url, :facebook_url, :password, :password_confirmation

  has_many :requests

  validates :password, confirmation: true

  validates :name, :description, :city, :address,:operation_days, :opening_time, :closing_time, :phone_number, :website_url, :password, :email, presence: true
  validates :name, :description, :address, :phone_number, :website_url, :password, :email, uniqueness: true


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