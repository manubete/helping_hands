require 'spec_helper'

describe Organization do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:operation_days) }
  it { should validate_presence_of(:operation_hours) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:website_url) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }

  it { should have_many(:requests) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:address) }
  it { should validate_uniqueness_of(:phone_number) }
  it { should validate_uniqueness_of(:website_url) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:password) }
end