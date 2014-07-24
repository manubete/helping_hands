require "spec_helper"

describe DonorMailer do
  describe "donor_contribution_notification" do
    let(:mail) { DonorMailer.donor_contribution_notification }

    it "renders the headers" do
      mail.subject.should eq("Donor contribution notification")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
