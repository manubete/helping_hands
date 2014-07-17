require 'spec_helper'

describe Contribution do
    it { should validate_presence_of(:resource_amount) }
    it { should validate_numericality_of(:resource_amount)}

    it { should belong_to(:donor) }
    it { should belong_to(:request) }

end