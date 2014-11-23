require 'spec_helper'

describe SessionsController do
  context "#create" do
    xit "should create a new session with valid params" do
    end
  end

  context "#destroy" do
    xit "should clear the session and redirect to the root path" do

      redirect_to root_path
    end
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
