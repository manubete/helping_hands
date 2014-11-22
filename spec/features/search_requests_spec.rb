require 'spec_helper'

feature 'Logged in user' do
  scenario 'can view requests page' do
    visit requests_path
    expect(page).to have_content('Needs of Organizations')
  end

  scenario 'can see at least one request' do
    puts "Running scenario: can see at least one request"
    FactoryGirl.create(:request)
    visit requests_path
    #expect(page).to have_content('Needs')
    expect(page).to have_content('Posted')
    #expect(page).to have_content('Ends')
    expect(page).to have_content('Tags')
  end

  scenario 'can search for a request' do
    puts "Running scenario: can search for a request"
    FactoryGirl.create(:request)
    Request.create(organization_id: 2, resource: 'underwear', current_resource_count: 0, target_resource_count: 100, address: 'the castro', organization: 'Underwear Supply Co', description: 'Naked dudes in the Castro need underpants', start_date: Date.today, end_date: Date.today.next_day, complete: false, tag_list: ['Clothing'])

    visit requests_path
    fill_in 'search', :with => 'Test Org'
    click_on 'Search'
    expect(page).to have_content('100 Fake Street')
    expect(page).to_not have_content('the castro')
  end

  scenario 'can click on and view a request' do
    FactoryGirl.create(:request)
    FactoryGirl.create(:organization)
    visit requests_path
    click_on 'Test Org'
    expect(page).to have_content('Delivery Address')
    expect(page).to have_content('Upload a clear photo of your donation')
  end

  # TODO: test sorting functionality
end
