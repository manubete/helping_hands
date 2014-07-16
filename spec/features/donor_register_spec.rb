require 'spec_helper'

feature 'new donor signing up' do
  let!(:donor) {FactoryGirl.create :donor}
  let!(:donor_attr) {FactoryGirl.attributes_for :donor}

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
      fill_in 'Name', :with => donor_attr[:name]
      fill_in 'City', :with => donor_attr[:city]
      fill_in 'Address', :with => donor_attr[:address]
      fill_in 'Phone', :with => donor_attr[:phone_number]
      fill_in 'Email', :with => donor_attr[:email]
      fill_in 'Username', :with => donor_attr[:username]
      fill_in 'Password', :with => donor_attr[:password], :match => :first
      fill_in 'Password Confirmation', :with => donor_attr[:password_confirmation]
      click_on 'Register'
    end
    expect(page).to have_content("You have successfully signed up!")
  end
end
