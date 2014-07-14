require 'spec_helper'
require_relative 'factories'

describe RequestsController do
  context "#index" do

    # TODO: Test the search functionality

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

  # context "#new" do
  #   it "should render the new view" do
  #     req = FactoryGirl.create(:request)
  #     org = FactoryGirl.create(:organization)
  #     get :show, id: req.org
  #     expect(response.status).to eq 200
  #   end
  # end

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
        Request.create(organization: nil, resource: nil, resource_count: nil, address: nil, description: nil)
      }.to_not change { Request.count }.by(1)
    end

    it "should not save a request with invalid resource_count field to the database" do
      expect{
        Request.create(organization: "Blah", resource: "Blah", resource_count: "eighty", address: "Blah", description: "Blah")
      }.to_not change { Request.count }.by(1)
    end
  end

  # context "#edit" do
  #   it "should render the edit view when given a valid request id" do
  #     req = FactoryGirl.create(:request)
  #     get :show, id: req
  #     expect(response.status).to eq 200
  #   end
  # end

  context "#update" do
    before(:each) do
      @req = FactoryGirl.create(:request)
    end

    it "should save valid changes to request attributes" do
      put :update, id: @req, request: FactoryGirl.attributes_for(:request, organization: "TestyTestTest", resource: "All the monies")
      @req.reload
      @req.organization.should eq("TestyTestTest")
      @req.resource.should eq("All the monies")
    end

    it "should redirect to the updated request page" do
      put :update, id: @req, request: FactoryGirl.attributes_for(:request)
      response.should redirect_to @req
    end

    it "should not update an request when params are invalid" do
      put :update, id: @req, request: FactoryGirl.attributes_for(:request, organization: nil, resource: nil)
      @req.reload
      @req.organization.should_not eq(nil)
      @req.resource.should eq("bottled water")
    end

    it "re-renders the edit view when params are invalid" do
     expect{
      render_template :edit
     }
    end
  end

  # context "#show" do
  #   it "should render the show view when given a valid Request id" do
  #     req = FactoryGirl.create(:request)
  #     org = FactoryGirl.create(:organization)
  #     get :show, id: req.org
  #     expect(response.status).to eq 200
  #   end
  # end

  context "api request" do

    # TODO: Not sure how to test this.

  end
end
