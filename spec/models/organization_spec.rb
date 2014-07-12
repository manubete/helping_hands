require 'spec_helper'

describe Organization do

  let(:organization){ Organization.create(username: "Test Org", email: "test@test.com", password: "password11", password_confirmation: "password11")}

  it "is invalid without an email address" do
    organization.update_attributes(email: nil).should eq false
  end

  it "is invaid without a password" do
    organization.update_attributes(password: nil).should eq false
  end

  it "is invalid if the password and password_confirmation do not match" do
    organization.update_attributes(password_confirmation: "erinerinerin").should eq false
  end

  it "is valid if the password and password_confirmation do match" do
    organization.update_attributes(password_confirmation: "password11").should eq true
  end
end

# TODO: Test uniqueness validation here (currently tested in controller)?