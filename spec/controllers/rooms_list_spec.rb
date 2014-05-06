require 'spec_helper'

describe UsersController do
  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end
end