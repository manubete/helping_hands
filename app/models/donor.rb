class Donor < ActiveRecord::Base
  attr_accessible :name, :city, :address, :phone_number, :email, :password,:security_question, :security_answer, :password_confirmation

  validates :password, confirmation: true
  validates :name, :city, :address, :phone_number, :password, :security_question, :security_answer, :email, presence: true
  validates :name, :address, :phone_number, :password, :email, uniqueness: true
  # Why would the security question and answer need to be unique? What if 2 people want to use their mothers' maiden names and they both happen to be Smith?

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

end