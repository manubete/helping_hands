require 'spec_helper'

feature 'new donor signing up' do
  scenario "should be able to see the sign up button when logged out" do
    visit root_path
    expect(page).to have_content('Sign Up')
  end

  scenario "should be able to see the donor registration button after clicking on Sign Up" do
    visit user_type_confirmation_sessions_path
    expect(page).to have_content('Would you like to contribute?')
  end

  scenario "should be able to register as a new donor" do
    visit new_donor_path
    within 'form#new_donor' do
      fill_in 'Name', :with => 'test name'
      fill_in 'City', :with => 'test city'
      fill_in 'Address', :with => 'test address'
      fill_in 'Phone', :with => 'test number'
      fill_in 'Email', :with => 'test@test.com'
      fill_in 'Security Question', :with => 'test question'
      fill_in 'Security Answer', :with => 'test answer'
      fill_in 'Password', :with => '12345', :match => :first
      fill_in 'Password Confirmation', :with => '12345'
      click_on 'Register'
    end
    expect(page).to have_content("You have successfully signed up!")
  end
end
