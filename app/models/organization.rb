class Organization < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  attr_accessible :name, :description, :city, :address, :operation_days,
                  :opening_time, :closing_time, :phone_number, :email,
                  :website_url, :linked_in_url, :facebook_url, :password,
                  :password_confirmation, :avatar, :avatar_cache

  has_many :requests
  has_secure_password

  validates :password, :length => { :minimum => 6 }, :if => :password_digest_changed?
  validates :password_confirmation, :presence => true, :if => :password_digest_changed? 

  validates :name, :description, :city, :address, :operation_days, :opening_time,
            :closing_time, :phone_number, :website_url, :email,
            :presence => true
  validates :name, :description, :address, :phone_number, :website_url, :email,
            :uniqueness => true

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

  def fixlistname
    self.name = name.lstrip
    self.name += '...' unless name.ends_with?('...')
    self.name[0] = name.slice(0,1).capitalize + name.slice(1..-1)
  end

end
