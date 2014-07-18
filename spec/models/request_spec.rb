require 'spec_helper'

describe Request do
  let(:request){ Request.create(organization: "Test Org", resource: "test resource", resource_count: 100, address: "100 fake street", description: "test desc")}

  it "is invalid with non-integers in the resource_count field" do
    request.update_attributes(resource_count: "One Hundred").should eq false
  end

  it "is invalid with blank fields" do
    request.update_attributes(organization: nil, resource: nil, resource_count: nil, address: nil, description: nil).should eq false
  end

  # TO DO: How do I write a unit test for the search function? Should that just be a feature test?

end
