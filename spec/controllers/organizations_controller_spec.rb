require 'spec_helper'

describe OrganizationsController do
  context "#new" do
    it "should render the new view" do
      get :new
      expect(response.status).to eq 200
    end
  end

  context "#create" do
    it "should save an organization with valid params to the database" do
      expect{
        FactoryGirl.create(:organization)
      }.to change { Organization.count }.by(1)
    end

    it "should redirect to the organization show path after creating a valid donor" do
      expect{
        @org = FactoryGirl.create(:organization)
        redirect_to organization_path(@org.id)
      }
    end

    it "should not save an organization to the database when params are left blank" do
      expect{
        Organization.create(name: nil, city: nil, address: nil, operation_days: nil, opening_time: nil, closing_time: nil, phone_number: nil, email: nil, website_url: nil, description: nil, password: nil)
      }.to_not change { Organization.count }.by(1)
    end

    it "should re-render the :new template after not saving a non-valid organization to the database" do
      expect{
        render_template :new
      }
    end
  end

  context "#show" do
    it "should render the show view when given a valid Organization id" do
      @org = FactoryGirl.create(:organization)
      get :show, id: @org.id
      expect(response.status).to eq 200
    end
  end

  context "#edit" do
    it "should render the edit view when given a valid organization id" do
      @org = FactoryGirl.create(:organization)
      get :edit, id: @org.id
      expect(response.status).to eq 200
    end
  end

  context "#update" do
    before(:each) do
      @org = FactoryGirl.create(:organization)
    end

    it "should save valid changes to organization attributes" do
      put :update, id: @org, organization: FactoryGirl.attributes_for(:organization, name: "JoeBobJim", city: "San Diego")
        @org.reload
        @org.name.should eq("JoeBobJim")
        @org.city.should eq("San Diego")
    end

    it "should redirect to the updated organization page" do
      put :update, id: @org, organization: FactoryGirl.attributes_for(:organization)
      response.should redirect_to @org
    end

    it "should not update an organization when params are invalid" do
      put :update, id: @org, organization: FactoryGirl.attributes_for(:organization, email: nil)
        @org.reload
        @org.email.should_not eq(nil)
        @org.city.should eq("San Francisco")
    end

    it "re-renders the edit view when params are invalid" do
     expect{
      render_template :edit
     }
    end

  end
end
