class OrganizationMailer < ActionMailer::Base
  default :from => "serena@helpfulhand.org"
  def notify_contribution(email_hash)

    @organization = email_hash.fetch(:organization)
    @donor = email_hash.fetch(:donor)
    @contribution = email_hash.fetch(:contribution)
    @request = email_hash.fetch(:request)

    mail to: @organization.email, subject: "New Contribution", :content_type => 'text/html'
  end

  def password_reset(organization)
    @organization = organization
    mail :to => organization.email, :subject => "Password Reset"
  end

end
