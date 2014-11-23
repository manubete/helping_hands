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
      fill_in 'organization_address', :with => '123 Market Street, San Francisco, CA'
      select 'Monday', :from => 'Operating Days'
      select '12 PM', :from => 'Open from', :match => :first
      select '02', :from => 'Open from', :match => :prefer_exact
      select '11 PM', :from => 'Until', :match => :first
      select '02', :from => 'Until', :match => :prefer_exact
      fill_in 'Tax ID', :with => '123456'
      fill_in 'Phone Number', :with => 'test org number'
      fill_in 'Email Address', :with => 'test@test.com'
      fill_in 'Website URL', :with => 'http://test.com'
      fill_in 'LinkedIn URL', :with => 'linkedin.com/test'
      fill_in 'Facebook URL', :with => 'facebook.com/test'
      fill_in 'Password', :with => '12345678', :match => :first
      fill_in 'Password Confirm', :with => '12345678'
      click_on 'Register'
    end
    expect(page).to have_content("You have successfully signed up!")
  end

end
