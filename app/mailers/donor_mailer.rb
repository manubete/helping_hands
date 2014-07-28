class DonorMailer < ActionMailer::Base
  default :from => "helpfulhandorg@gmail.com"


  def donor_contribution_notification(email_hash)

    @organization = email_hash.fetch(:organization)
    @donor = email_hash.fetch(:donor)
    @contribution = email_hash.fetch(:contribution)
    @request = email_hash.fetch(:request)

    mail to: @donor.email, subject: "New Contribution"
  end

  def password_reset(donor)
    @donor = donor
    mail :to => donor.email, :subject => "Password Reset"
  end
end
