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

    it "should redirect to the requests path after creating a valid donor" do
      expect{
        redirect_to Organization.last
      }
    end

    it "should not save an organization to the database when params are left blank" do
      expect{
        Organization.create(name: nil, city: nil, phone_number: nil, email: nil, website_url: nil, linked_in_url: nil, facebook_url: nil, password: nil, password_confirmation: nil)
      }.to_not change { Organization.count }.by(1)
    end

    it "should not create an organization with invalid password confirmation" do
      expect{
        Organization.create(name: "Sample Org", city: "San Francisco",
        address: "huey street",
        operation_days: "m - t",
        opening_time: Time.now,
        closing_time: Time.now + (60*60*5),
         phone_number: "555-555-5555", email: "name@sample.org", website_url: "http://www.google.com", linked_in_url: "https://www.linkedin.com/profile/view?id=137499030", facebook_url: "http://facebook.com/sample", password: "password", password_confirmation: "password21")
      }.to_not change { Organization.count }.by(1)
    end

    # For some reason, the following test will NOT work if I use FactoryGirl.create(:organization) but WILL work if I use Organization.create, even though it's essentially the exact same thing. TODO: Figure out why that is!

    it "should not save a second organization to the database when the params are not unique" do
      expect{
        2.times do
        Organization.create(name: "Sample Org", city: "San Francisco",
          description: "Insert Org description here",
        address: "huey street",
        operation_days: "m - t",
        opening_time: Time.now,
        closing_time: Time.now + (60*60*5),
         phone_number: "555-555-5555", email: "name@sample.org", website_url: "http://www.google.com", linked_in_url: "https://www.linkedin.com/profile/view?id=137499030", facebook_url: "http://facebook.com/sample", password: "password", password_confirmation: "password",
         security_question: "dog name?",
    security_answer: "pepper")
        end
      }.to change { Organization.count }.by(1)
    end

    it "should re-render the :new template after not saving a non-valid organization to the database" do
      expect{
        render_template :new
      }
    end
  end

  context "#show" do
    it "should render the show view when given a valid Organization id" do
      org = FactoryGirl.create(:organization)
      get :show, id: org
      expect(response.status).to eq 200
    end
  end

  context "#edit" do
    it "should render the edit view when given a valid organization id" do
      org = FactoryGirl.create(:organization)
      get :edit, id: org
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