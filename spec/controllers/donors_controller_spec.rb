require 'spec_helper'
require_relative 'factories'

describe DonorsController do
  context "#new" do
    it "should render the new view" do
      get :new
      expect(response.status).to eq 200
    end
  end

  context "#create" do
    it "should save a donor with valid params to the database" do
      expect{
        FactoryGirl.create(:donor)
      }.to change { Donor.count }.by(1)
    end

    it "should redirect to the requests path after creating a valid donor" do
      expect{
        redirect_to Donor.last
      }
    end

    it "should not save a donor to the database when params are left blank" do
      expect{
      Donor.create(name: nil, city: nil, phone_number: nil, email: nil, username: nil, password: nil)
      }.to_not change{ Donor.count }
    end

    # For some reason, the following test will NOT work if I use FactoryGirl.create(:organization) but WILL work if I use Organization.create, even though it's essentially the exact same thing. TODO: Figure out why that is!

    it "should not save a second donor to the database when params are not unique" do
      expect{
        2.times do
          Donor.create(name: "Erin", city: "San Francisco", phone_number: "555-555-5555", email: "erin@erin.com", username: "ErinJoan", password: "erinisgreat")
        end
      }.to_not change { Donor.count }.by(2)
    end
  end

  it "should re-render the :new template after not saving a non-valid donor to the database" do
    expect{
      render_template :new
      }
  end
end