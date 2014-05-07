require 'spec_helper'

feature 'Users' do
  context "the user can see the room_list page" do
    it "can go to the homepage and sees the create_room button" do
      visit root_path
      expect(page).to have_content("Create a Room")
    end


    it "can go to the homepage and see a list of room" do
      visit root_path
      #wait_for_ajax_to_finish
      page.should have_selector('div')
      page.should have_selector('i')
    end

  end
end