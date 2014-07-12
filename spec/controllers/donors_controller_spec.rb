require 'spec_helper'

describe DonorsController do
  context "#index" do
    it "should get a 200 response" do
      get :index
      expect(response.status).to eq 200
    end
  end

  context "#new" do
    it "should get a 200 response" do
      get :new
      expect(response.status).to eq 200
    end
  end

  context "#create" do
    it "creates a donor with valid params" do
      expect{
        Donor.create(name: "Erin", city: "San Francisco", phone_number: "555-555-5555", email: "erin@erin.com", username: "ErinJoan", password: "erinisgreat")
      }.to change { Donor.count }.by(1)
    end

    it "doesn't create a donor when params are left blank" do
      expect{
      Donor.create(name: "", city: "", phone_number: "", email: "", username: "", password: "")
      }.to_not change{ Donor.count }
    end

    it "doesn't create a second donor when params are not unique" do
      expect{
        2.times do
          Donor.create(name: "Erin", city: "San Francisco", phone_number: "555-555-5555", email: "erin@erin.com", username: "ErinJoan", password: "erinisgreat")
        end
      }.to change { Donor.count }.by(1)
    end
  end
end