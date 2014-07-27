require 'faker'

10.times do
  Donor.create(name: Faker::Name.name, city: Faker::Address.city, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, password: Faker::Internet.password, security_question: Faker::Lorem.words(4), security_answer: Faker::Lorem.word)
end

10.times do
  Organization.create(name: Faker::Company.name, description: Faker::Lorem.sentence, city: Faker::Address.city, address: Faker::Address.street_address, operation_days: 'M-F', opening_time: Time.now, closing_time: Time.now + (60*60*5), phone_number: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, website_url: Faker::Internet.url, linked_in_url: Faker::Internet.url('linkedin.com'), facebook_url: Faker::Internet.url('facebook.com'), password: "password", password_confirmation: "password", security_question: Faker::Lorem.words(4), security_answer: Faker::Lorem.word)
end

10.times do
  Request.create(organization_id: Faker::Number.number(1), resource: Faker::Lorem.word, current_resource_count: Faker::Number.digit, target_resource_count: Faker::Number.digit, address: Faker::Address.street_address, organization: Faker::Company.name, description: Faker::Lorem.sentence, start_date: Date.today, end_date: Date.today.next_day, complete: false, tag_list: ["sdf","sds"])
end
