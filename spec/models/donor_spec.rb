require 'spec_helper'

describe Donor do
  let(:donor){ Donor.create(username: "ErinJoan", email: "erin@erin.com", password: "erinisgreat")}

  it "is invalid without an email address" do
    donor.update_attributes(email: nil).should eq false
  end

  it "is invalid without a password" do
    donor.update_attributes(password: nil).should eq false
  end
  it "is invalid if password and password confirmation do not match" do
    donor.update_attributes(password_confirmation: "erinerinerin").should eq false
  end

  #dont know why this is failing, maybe because password_confirmation is a field?
  it "is valid if password and password_confirmation do match" do
    donor.update_attributes(password: "erinerinerin",password_confirmation: "erinerinerin").should eq true
  end
end

# TODO: Test uniqueness validation here (currently tested in controller)?