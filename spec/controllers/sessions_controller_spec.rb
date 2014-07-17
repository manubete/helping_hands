require 'spec_helper'

describe SessionsController do

  context "#new_donor" do
    it "should render the new donor view" do
      get :new_donor
      expect(response.status).to eq 200
    end
  end

  context "#new_organization" do
    it "should render the new organization view" do
      get :new_organization
      expect(response.status).to eq 200
    end
  end

  context "#create" do
  end

  context "#destroy" do
  end

  context "#user_type_confirmation" do
    it "should render the donor and organization registration view" do
      get :user_type_confirmation
      expect(response.status).to eq 200
    end
  end

  context "#user_type_login_confirmation" do
    it "should render the donor and organization login (or error message) view" do
      get :user_type_login_confirmation
      expect(response.status).to eq 200
    end
  end
end