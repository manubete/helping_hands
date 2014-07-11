class Organization < ActiveRecord::Base
  attr_accessible :name, :city, :phone_number, :email, :website_url, :linked_in_url, :facebook_url, :username, :password, :password_confirmation

  validates :password, confirmation: true
  validates :password, :email, presence: true
  validates :username, :password, :email, uniqueness: true


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