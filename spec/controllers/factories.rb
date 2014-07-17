FactoryGirl.define do

  factory :donor do
    name "Erin"
    city "San Francisco"
    address "Lovely dovely Street"
    phone_number "555-555-5555"
    email "erin@erin.com"
    username "ErinJoan"
    password "erinisgreat"
  end

  factory :organization do
    name "Sample Org"
    city "San Francisco"
    address "Lovely Org Street"
    operation_days "M-Th"
    operation_hours "9 to 5"
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
    organization_id 2
    start_date Date.today
    end_date Date.today.next_day
    resource "bottled water"
    resource_count 100
    complete false
    address "100 Fake Street"
    description "Refugees without clean water supply"
    tag_list ["sdf","sds"]
  end
end