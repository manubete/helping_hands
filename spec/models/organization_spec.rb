require 'spec_helper'

describe Organization do
  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:operation_days) }
    it { should validate_presence_of(:opening_time) }
    it { should validate_presence_of(:closing_time) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:website_url) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:security_question) }
    it { should validate_presence_of(:security_answer) }
    it { should validate_presence_of(:email) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:description) }
    it { should validate_uniqueness_of(:address) }
    it { should validate_uniqueness_of(:phone_number) }
    it { should validate_uniqueness_of(:website_url) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:password) }
  end

  context "Associations" do
    it { should have_many(:requests) }
  end

end
