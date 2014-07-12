require 'spec_helper'
require_relative 'factories'

describe RequestsController do
  context "#index" do
    it "should render the index view" do
      get :index
      expect(response.status).to eq 200
    end

    it "should display a list of requests" do
      req = FactoryGirl.create(:request)
      get :index
      assigns(:requests).should eq([req])
    end
  end

  context "#new" do
    it "should render the new view" do
      get :new
      expect(response.status).to eq 200
    end
  end

  context "#create" do
    it "should save a request with valid params to the database" do
      expect{
        FactoryGirl.create(:request)
      }.to change { Request.count }.by(1)
    end

    it "should redirect to the root path after creating a new request" do
      expect{
        redirect_to root_path
      }
    end

    it "should not save a request to the database when params are left blank" do
      expect{
        Request.create(organization: "", resource: "", resource_count: "", address: "", description: "", purpose: "")
      }.to_not change { Request.count }.by(1)
    end

    it "should not save a request with invalid resource_count field to the database" do
      expect{
        Request.create(organization: "Blah", resource: "Blah", resource_count: "eighty", address: "Blah", description: "Blah", purpose: "Blah")
      }.to_not change { Request.count }.by(1)
    end
  end

  context "#show" do
    it "should render the show view when given a valid Request id" do
      req = FactoryGirl.create(:request)
      get :show, id: req
      expect(response.status).to eq 200
    end
  end

  context "landing page" do
    it "should render the landing page" do
      expect{
        render_template :landing_page
      }
    end
  end
end
