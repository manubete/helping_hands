require 'spec_helper'

feature 'new organization signing up' do
  scenario "should be able to see the sign up button when logged out" do
    visit root_path
    expect(page).to have_content('Sign Up')
  end

  scenario "should be able to see the organization registration button after clicking on Sign Up" do
    visit user_type_confirmation_sessions_path
    expect(page).to have_content('Are you an Organization?')
  end

  scenario "should be able to register as a new organization" do
    visit new_organization_path
    within 'form#new_organization' do
      fill_in 'Name', :with => 'test org name'
      fill_in 'Description', :with => 'test org desc'
      fill_in 'City', :with => 'test org city'
      fill_in 'Address', :with => 'test org address'
      fill_in 'Open on Operating Days', :with => 'Monday - Tuesday'
      select '22', :from => 'Open from', :match => :first
      select '02', :from => 'Open from', :match => :prefer_exact
      select '22', :from => 'Until', :match => :first
      select '02', :from => 'Until', :match => :prefer_exact
      fill_in 'Phone', :with => 'test org number'
      fill_in 'Email', :with => 'test@test.com'
      fill_in 'Website', :with => 'http://test.com'
      fill_in 'LinkedIn', :with => 'linkedin.com/test'
      fill_in 'Facebook', :with => 'facebook.com/test'
      fill_in 'Security Question', :with => 'test question'
      fill_in 'Security Answer', :with => 'test answer'
      fill_in 'Password', :with => '12345', :match => :first
      fill_in 'Password Confirmation', :with => '12345'
      click_on 'Register'
    end
    expect(page).to have_content("You have successfully signed up!")
  end

end