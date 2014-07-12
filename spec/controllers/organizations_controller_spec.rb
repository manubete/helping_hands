require 'spec_helper'

describe OrganizationsController do
  context "#new" do
    it "should get a 200 response" do
      get :new
      expect(response.status).to eq 200
    end
  end

  context "#create" do
    it "should create an organization with valid params" do
      expect{
        Organization.create(name: "Sample Org", city: "San Francisco", phone_number: "555-555-5555", email: "name@sample.org", website_url: "http://www.google.com", linked_in_url: "https://www.linkedin.com/profile/view?id=137499030", facebook_url: "http://facebook.com/sample", username: "SampleOrg", password: "password", password_confirmation: "password")
      }.to change { Organization.count }.by(1)
    end

    it "should not create an organization with blank params" do
      expect{
        Organization.create(name: "", city: "", phone_number: "", email: "", website_url: "", linked_in_url: "", facebook_url: "", username: "", password: "", password_confirmation: "")
      }.to_not change { Organization.count }.by(1)
    end

    it "should not create an organization with invalid password confirmation" do
      expect{
        Organization.create(name: "Sample Org", city: "San Francisco", phone_number: "555-555-5555", email: "name@sample.org", website_url: "http://www.google.com", linked_in_url: "https://www.linkedin.com/profile/view?id=137499030", facebook_url: "http://facebook.com/sample", username: "SampleOrg", password: "password", password_confirmation: "password1")
      }.to_not change { Organization.count }.by(1)
    end

    it "should not create 2 organizations with the same params (non unique)" do
      expect{
        2.times do
        Organization.create(name: "Sample Org", city: "San Francisco", phone_number: "555-555-5555", email: "name@sample.org", website_url: "http://www.google.com", linked_in_url: "https://www.linkedin.com/profile/view?id=137499030", facebook_url: "http://facebook.com/sample", username: "SampleOrg", password: "password", password_confirmation: "password")
        end
      }.to change { Organization.count }.by(1)
    end
  end

  context "#show" do
    # it "should get a 200 response when given a valid Organization id" do
    #   get :show
    #   expect(response.status).to eq 200
    # end

    # it "assigns the requested organization to @organization" do
    #   Organization.create
    #   get :show, id: organizations
    #   assigns(:organization).should eq(organization)
    # end
  end

  context "#edit" do
    it "updates the organization with valid params" do
      expect{

      }
    end

    it "does not update an organization when params are invalid" do
      expect{

      }
    end
  end
end