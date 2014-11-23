FactoryGirl.define do

  factory :donor do
    name "Erin"
    city "San Francisco"
    address "Lovely dovely Street"
    phone_number "555-555-5555"
    email "erin@erin.com"
    password "erinisgreat"
    password_confirmation "erinisgreat"
    # security_question "dog name?"
    # security_answer "pepper"
  end

  factory :organization do
    id 1
    name "Sample Org"
    description "Peppers paws gives stray french bulldogs a second chance"
    city "San Francisco"
    address "Lovely Org Street"
    operation_days "M-Th"
    opening_time Time.now
    closing_time Time.now + (60*60*5)
    phone_number "555-555-5555"
    email "name@sample.org"
    website_url "http://www.google.com"
    linked_in_url "https://www.linkedin.com/profile/view?id=137499030"
    facebook_url "http://facebook.com/sample"
    password "password"
    password_confirmation "password"
    tax_id '123456'
    # security_question "dog name?"
    # security_answer "pepper"
  end

  factory :request do
    organization_id 1
    resource "bottled water"
    current_resource_count 0
    target_resource_count 100
    address "100 Fake Street"
    organization "Test Org"
    description "Refugees without clean water supply"
    start_date Date.today
    end_date Date.today.next_day
    complete false
    tag_list "Water"
  end

  factory :contribution do
    donor_id 1
    request_id 1
    resource_amount 100
  end
end
