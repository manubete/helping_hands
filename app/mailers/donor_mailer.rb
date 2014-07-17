class DonorMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.donor_mailer.password_reset.subject
  #
  def password_reset(donor)
    @donor = donor
    mail :to => donor.email, :subject => "Password Reset"
  end
end
