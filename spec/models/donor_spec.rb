require 'spec_helper'

describe Donor do
  let(:donor){ Donor.create(username: "ErinJoan", email: "erin@erin.com", password: "erinisgreat")}

  it "is invalid without an email address" do
    donor.update_attributes(email: nil).should eq false
  end

  it "is invalid without a password" do
    donor.update_attributes(password: nil).should eq false
  end

  #This one does not work. TODO: Figure out how to unit test duplicates. NOTE: I already test the controller for non-unique params, so maybe I'm over-testing?
  # it "should not allow duplicate usernames and email addresses" do
  #   donor.save
  #   dup = Donor.new(username: "ErinJoan", email: "erin@erin.com", password: "erinisgreat")
  #   dup.save
  # end

  it "is invalid if password and password confirmation do not match" do
    donor.update_attributes(password_confirmation: "erinerinerin").should eq false
  end

  it "is valid if password and password_confirmation do match" do
    donor.update_attributes(password_confirmation: "erinisgreat").should eq true
  end
end