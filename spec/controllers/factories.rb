FactoryGirl.define do

  factory :donor do
    name "Erin"
    city "San Francisco"
    phone_number "555-555-5555"
    email "erin@erin.com"
    username "ErinJoan"
    password "erinisgreat"
  end

  factory :organization do
    name "Sample Org"
    city "San Francisco"
    phone_number "555-555-5555"
    email "name@sample.org"
    website_url "http://www.google.com"
    linked_in_url "https://www.linkedin.com/profile/view?id=137499030"
    facebook_url "http://facebook.com/sample"
    username "SampleOrg"
    password "password"
    password_confirmation "password"
  end

  factory :request do
    organization "Test Organization"
    resource "bottled water"
    resource_count "100"
    address "100 Fake Street"
    description "Refugees without clean water supply"
  end
end