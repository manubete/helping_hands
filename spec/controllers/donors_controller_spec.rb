require 'spec_helper'

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
        redirect_to requests_path
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
          Donor.create(name: "Erin", city: "San Francisco",
            address: "cutey street", phone_number: "555-555-5555", email: "erin@erin.com", username: "ErinJoan", password: "erinisgreat")
        end
      }.to change { Donor.count }.by(1)
    end

    it "should re-render the :new template after not saving a non-valid donor to the database" do
      expect{
      render_template :new
      }
    end
  end

  context "#show" do
    it "should render the show view when given a valid donor id" do
      donor1 = FactoryGirl.create(:donor)
      get :show, id: donor1
      expect(response.status).to eq 200
    end
  end

  context "#edit" do
    it "should render the edit view when given a valid donor id" do
      donor1 = FactoryGirl.create(:donor)
      get :edit, id: donor1
      expect(response.status).to eq 200
    end
  end

  context "update" do
    before(:each) do
      @donor1 = FactoryGirl.create(:donor)
    end

    it "should save valid changes to donor attributes" do
      @attributes = { email: "test22test@test.com", password: "12345" }
      put :update, :id => @donor1.id, :donor => @attributes
      @donor1.reload
      @donor1.email.should eq("test22test@test.com")
      @donor1.password.should eq("12345")
    end

    it "should redirect to the updated donor page" do
      put :update, id: @donor1, donor: FactoryGirl.attributes_for(:donor)
      response.should redirect_to @donor1
    end

    it "should not update a donor when params are invalid" do
      put :update, id: @donor1, donor: FactoryGirl.attributes_for(:donor, email: nil, password: nil)
      @donor1.reload
      @donor1.email.should_not eq(nil)
      @donor1.password.should_not eq(nil)
    end

    it "re-renders the edit view when params are invalid" do
      expect{
        render_template :edit
      }
    end
  end
end