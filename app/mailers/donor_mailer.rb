require 'mandrill'

class DonorMailer < ActionMailer::Base
  default :from => "info@rippleinapond.org"


  def donor_contribution_notification(email_hash)

    @organization = email_hash.fetch(:organization)
    @donor = email_hash.fetch(:donor)
    @contribution = email_hash.fetch(:contribution)
    @request = email_hash.fetch(:request)

    #mail to: @donor.email, subject: "New Contribution", :content_type => "text/html"

    m = Mandrill::API.new

    message = {
     :subject=> "Thank you for your contribution!",
     :from_name=> "Ripple in a Pond Team",
     :to=>[
       {
         :email=> @donor.email,
         :name=> @donor.name
       }
     ],
     :html=>render_to_string('donor_mailer/donor_contribution_notification.text', :layout => false),
     :from_email=>"info@rippleinapond.org"
    }
    sending = m.messages.send message
    puts sending

  end

  def password_reset(donor)
    @donor = donor
    #mail :to => donor.email, :subject => "Password Reset"

    m = Mandrill::API.new

    message = {
     :subject=> "Password Reset",
     :from_name=> "Ripple in a Pond Team",
     :to=>[
       {
         :email=> donor.email,
         :name=> donor.name
       }
     ],
     :html=>render_to_string('donor_mailer/password_reset.text', :layout => false),
     :from_email=>"info@rippleinapond.org"
    }
    sending = m.messages.send message
    puts sending

  end

  def registration_confirmation(donor)
    mail :to => donor.email, :subject => "Verify Account"
  end
end
