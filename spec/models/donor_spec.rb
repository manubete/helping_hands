require 'spec_helper'

describe Donor do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:email) }

  it { should have_many(:contributions) }
  it { should have_many(:requests).through(:contributions) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:address) }
  it { should validate_uniqueness_of(:phone_number) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:password) }
  it { should validate_uniqueness_of(:email) }
end
