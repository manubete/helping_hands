require 'spec_helper'

describe ContributionsController do
  context "#create" do
    it "should create a new contribution when given valid params" do
      expect {
        FactoryGirl.create(:contribution)
      }.to change { Contribution.count }.by(1)
    end

    it "should redirect to the requests path after saving the new contribution" do
      expect{
        redirect_to requests_path
      }
    end

    it "should not save a contribution to the database when params are left blank" do
      expect{
      Contribution.create(resource_amount: nil)
      }.to_not change{ Contribution.count }
    end

    it "should re-render the :new template after not saving a non-valid donor to the database" do
      expect{
        @contribution = FactoryGirl.create(:contribution)
        render_template request_path(@contribution.request_id)
      }
    end
  end
end