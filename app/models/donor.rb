class Donor < ActiveRecord::Base
  attr_accessible :name, :city, :address, :phone_number, :email, :username, :password, :password_confirmation

  validates :password, confirmation: true
  validates :password, :email, presence: true
  validates :email, uniqueness: true
  has_many :contributions
  has_many :requests, through: :contributions

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    DonorMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Donor.exists?(column => self[column])
  end

  def self.authenticate(email, password)
    @donor = Donor.find_by_email(email)
    if @donor && @donor.password == password
      p "#{email} #{password} #{@donor}"
      @donor
    else
      nil
    end
  end

end