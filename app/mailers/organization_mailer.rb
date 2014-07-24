class OrganizationMailer < ActionMailer::Base
  default :from => "helpfulhandorg@gmail.com"
  def notify_contribution(email_hash)

    @organization = email_hash.fetch(:organization)
    @donor = email_hash.fetch(:donor)
    @contribution = email_hash.fetch(:contribution)
    @request = email_hash.fetch(:request)

    mail to: @organization.email, subject: "New Contribution"
  end

end
