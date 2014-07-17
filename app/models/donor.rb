class Donor < ActiveRecord::Base
  attr_accessible :name, :city, :address, :phone_number, :email, :username, :password, :password_confirmation

  validates :password, confirmation: true
  validates :password, :email, presence: true
  validates :password, :email, uniqueness: true
  has_many :contributions
  has_many :requests, through: :contributions

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