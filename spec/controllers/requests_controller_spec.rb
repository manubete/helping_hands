require 'spec_helper'

describe RequestsController do
  context "#index" do

    # TODO: Test the sort_column and sort_direction helpers

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
      @req = FactoryGirl.create(:request)
      session[:organization_id] = 1
      FactoryGirl.create(:organization)
      get :new, id: @req
      expect(response.status).to eq 200
    end
  end

  context "#create" do
    it "should save a request with valid params to the database" do
      expect{
        FactoryGirl.create(:request)
      }.to change { Request.count }.by(1)
    end

    it "should redirect to the requests path after creating a new request" do
      expect{
        redirect_to requests_path
      }
    end

    it "should not save a request to the database when params are left blank" do
      expect{
        Request.create(organization: nil, resource: nil, current_resource_count: nil, target_resource_count: nil, address: nil, description: nil)
      }.to_not change { Request.count }.by(1)
    end
  end

  context "#edit" do
    it "should render the edit view when given a valid request id" do
      @req = FactoryGirl.create(:request)
      get :edit, id: @req
      expect(response.status).to eq 200
    end
  end

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

  context "#show" do
    it "should render the show view when given a valid Request id" do
      @req = FactoryGirl.create(:request)
      FactoryGirl.create(:organization)
      Organization.find(@req.organization_id)
      get :show, id: @req
      expect(response.status).to eq 200
    end
  end

  context "api request" do
    # TODO: Not sure how to test this.
  end
end
