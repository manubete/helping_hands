class Donor < ActiveRecord::Base
  attr_accessible :name, :city, :address, :phone_number, :email, :password, :password_confirmation

  has_secure_password

  validates :password, :length => { :minimum => 6 }, :if => :password_digest_changed?
  validates :password_confirmation, :presence => true, :if => :password_digest_changed?

  validates :name, :city, :address, :phone_number, :email, presence: true
  validates :name, :address, :phone_number, :email, uniqueness: true

  has_many :contributions
  has_many :requests, through: :contributions

  def self.authenticate(email, password)
    @donor = Donor.find_by_email(email)
    if @donor && @donor.password == password
      # p "#{email} #{password} #{@donor}"
      @donor
    else
      nil
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    save!
    DonorMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Donor.exists?(column => self[column])
  end

end
