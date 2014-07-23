require 'spec_helper'

feature 'Logged in user' do
  scenario 'can view requests page' do
    visit requests_path
    expect(page).to have_content('Needs of Organizations')
  end

  scenario 'can see at least one request' do
    FactoryGirl.create(:request)
    visit requests_path
    expect(page).to have_content('Needs')
    expect(page).to have_content('Posted')
    expect(page).to have_content('Ends')
    expect(page).to have_content('Tags')
  end

  scenario 'can search for a request' do
    Request.create(organization_id: 1, resource: 'bottled water', current_resource_count: 0, target_resource_count: 100, address: '100 fake street', organization: 'test org', description: 'Refugees without clean water supply', start_date: Date.today, end_date: Date.today.next_day, complete: false, tag_list: ["sdf","sds"])
    Request.create(organization_id: 2, resource: 'underwear', current_resource_count: 0, target_resource_count: 100, address: 'the castro', organization: 'Underwear Supply Co', description: 'Naked dudes in the Castro need underpants', start_date: Date.today, end_date: Date.today.next_day, complete: false, tag_list: ["sdf","sds"])

    visit requests_path
    fill_in 'search', :with => 'test org'
    click_on 'Search'
    expect(page).to have_content('100 fake street')
    expect(page).to_not have_content('the castro')
  end

  # TODO: test sorting functionality
end
