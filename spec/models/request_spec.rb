require 'spec_helper'

describe Request do
  context "Validations" do
    it { should validate_presence_of(:organization) }
    it { should validate_presence_of(:resource) }
    it { should validate_presence_of(:resource_count) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:resource_count) }
  end

  context "Associations" do
    it { should have_many(:contributions) }
    it { should have_many(:donors).through(:contributions) }
  end

  # TO DO: How do I write a unit test for the search function? Should that be a feature test?
end
