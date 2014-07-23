require 'spec_helper'

feature 'Registered user' do
  scenario 'should be able to see the login button when logged out' do
    visit root_path
    expect(page).to have_content('Log In')
  end

  scenario 'should be able to log in with valid params' do
    FactoryGirl.create(:donor)
    log_in_with 'erin@erin.com', 'erinisgreat'
    expect(page).to have_content("successful login!!")
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

  def log_in_with(email, password)
    visit user_type_login_confirmation_sessions_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log In'
  end
end