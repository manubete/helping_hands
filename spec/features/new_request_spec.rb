require 'spec_helper'

feature 'Logged in organization' do
  scenario 'can make a new request' do
    FactoryGirl.create(:organization)
    visit user_type_login_confirmation_sessions_path
    fill_in 'Email', with: 'name@sample.org'
    fill_in 'Password', with: 'password'
    click_on 'Log In'
    expect(page).to have_content("successful login!!")
    click_on 'PROFILE'
    expect(page).to have_content('Make New Request')
    click_on 'Make New Request'
    expect(page).to have_content('Make a Request')

    within 'form#new_request' do
      fill_in 'request[resource]', :with => 'pop tarts'
      fill_in 'request[target_resource_count]', :with => 200
      fill_in 'request[address]', :with => 'my house'
      fill_in 'request[description]', :with => "I'm hungry and I want some pop tarts."
      fill_in 'request[tag_list]', :with => 'erin'
      select '2014', :from => 'request[start_date(1i)]'
      select 'July', :from => 'request[start_date(2i)]', :match => :prefer_exact
      select '23', :from => 'request[start_date(3i)]', :match => :prefer_exact
      select '2015', :from => 'request[end_date(1i)]', :match => :first
      select 'July', :from => 'request[end_date(2i)]', :match => :prefer_exact
      select '23', :from => 'request[end_date(3i)]', :match => :prefer_exact
      click_on 'Submit'
    end
    expect(page).to have_content("You have successfully created the request!")
    expect(page).to_not have_content("Incorrect signup information for the request")
  end
end