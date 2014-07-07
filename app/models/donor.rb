class Donor < ActiveRecord::Base
  attr_accessible :name, :city, :phone_number, :email, :username, :password, :password_confirmation

  validates :password, confirmation: true
  validates :password, :email, presence: true
  validates :username, :password, :email, uniqueness: true

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