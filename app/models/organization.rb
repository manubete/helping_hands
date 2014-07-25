class Organization < ActiveRecord::Base
  attr_accessible :name, :description, :city, :address, :operation_days, :opening_time, :closing_time, :phone_number, :email, :website_url, :linked_in_url, :facebook_url, :password,:security_question, :security_answer, :password_confirmation

  has_many :requests

  validates :password, confirmation: true

  validates :name, :description, :city, :address,:operation_days, :opening_time, :closing_time, :phone_number, :website_url, :password,:security_question, :security_answer, :email, presence: true
  validates :name, :description, :address, :phone_number, :website_url, :email, uniqueness: true


  def self.authenticate(email, password)
    @organization = Organization.find_by_email(email)
    if @organization && @organization.password == password
      # p "#{email} #{password} #{@organization}"
      @organization
    else
      nil
    end
  end

   def send_password_reset
    generate_token(:password_reset_token)
    save!
    OrganizationMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Organization.exists?(column => self[column])
  end



end