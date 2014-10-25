class OrganizationMailer < ActionMailer::Base
  default :from => "info@helpfulhand.org"
  def notify_contribution(email_hash)

    @organization = email_hash.fetch(:organization)
    @donor = email_hash.fetch(:donor)
    @contribution = email_hash.fetch(:contribution)
    @request = email_hash.fetch(:request)

    #mail to: @organization.email, subject: "New Contribution", :content_type => 'text/html'

    m = Mandrill::API.new

    message = {
     :subject=> "New contribution!",
     :from_name=> "Helpful Hand Team",
     :to=>[
       {
         :email=> @organization.email,
         :name=> @organization.name
       }
     ],
     :html=>render_to_string('organization_mailer/notify_contribution.text', :layout => false),
     :from_email=>"info@helpfulhand.org"
    }
    sending = m.messages.send message
    puts sending
  end

  def password_reset(organization)
    @organization = organization
    #mail :to => organization.email, :subject => "Password Reset"
    m = Mandrill::API.new

    message = {
     :subject=> "Password Reset",
     :from_name=> "Helpful Hand Team",
     :to=>[
       {
         :email=> organization.email,
         :name=> organization.name
       }
     ],
     :html=>render_to_string('organization_mailer/password_reset.text', :layout => false),
     :from_email=>"info@helpfulhand.org"
    }
    sending = m.messages.send message
    puts sending
  end

end
