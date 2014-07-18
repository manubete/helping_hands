require 'spec_helper'

describe Contribution do
  context "Validations" do
    it { should validate_presence_of(:resource_amount) }
    it { should validate_numericality_of(:resource_amount)}
  end

  context "Associations" do
    it { should belong_to(:donor) }
    it { should belong_to(:request) }
  end

end