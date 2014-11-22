require 'spec_helper'

feature 'Registered donor' do
  scenario 'should be able to see the login button when logged out' do
    visit root_path
    expect(page).to have_content('Log In')
  end

  scenario 'should be able to log in with valid params' do
    FactoryGirl.create(:donor)
    log_in_with 'erin@erin.com', 'erinisgreat'
    expect(page).to have_content("Successfully logged in.")
  end

  scenario 'should not be able to log in with invalid params' do
    FactoryGirl.create(:donor)
    log_in_with 'invalid_email', 'erinisgreat'
    expect(page).to have_content('Unsuccessful login')
  end

  scenario 'should not be able to log in with blank password' do
    FactoryGirl.create(:donor)
    log_in_with 'erin@erin.com', ''
    expect(page).to have_content('Unsuccessful login')
  end

  scenario 'should be able to view their profile after logging in' do
    FactoryGirl.create(:donor)
    log_in_with 'erin@erin.com', 'erinisgreat'
    expect(page).to have_content("Successfully logged in.")
    click_on 'PROFILE'
    expect(page).to have_content('Location')
    expect(page).to have_content('San Francisco')
    expect(page).to have_content('Active Contributions')
    expect(page).to have_content('Contribution History')
  end

  def log_in_with(email, password)
    visit user_type_login_confirmation_sessions_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Log In'
  end
end

feature 'Registered organization' do
  scenario 'should be able to see the login button when logged out' do
    visit root_path
    expect(page).to have_content('Log In')
  end

  scenario 'should be able to log in with valid params' do
    FactoryGirl.create(:organization)
    log_in_with 'name@sample.org', 'password'
    expect(page).to have_content("Successfully logged in.")
  end

  scenario 'should not be able to log in with invalid params' do
    FactoryGirl.create(:organization)
    log_in_with 'invalid_email', 'password'
    expect(page).to have_content('Unsuccessful login')
  end

  scenario 'should not be able to log in with blank password' do
    FactoryGirl.create(:organization)
    log_in_with 'name@sample.org', ''
    expect(page).to have_content('Unsuccessful login')
  end

  scenario 'should be able to view their profile after logging in' do
    FactoryGirl.create(:organization)
    log_in_with 'name@sample.org', 'password'
    expect(page).to have_content("Successfully logged in.")
    click_on 'PROFILE'
    expect(page).to have_content('Make New Request')
    expect(page).to have_content('Active Requests')
    expect(page).to have_content('Request History')
  end

  def log_in_with(email, password)
    visit user_type_login_confirmation_sessions_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Log In'
  end
end
