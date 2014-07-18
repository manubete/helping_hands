require 'spec_helper'

describe SessionsController do


  context "#find_security_question" do
    it "should render the find security question view" do
      get :find_security_question
      expect(response.status).to eq 200
    end
  end


  context "#security_question" do
    it "should render the security_question view" do
      get :security_question
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