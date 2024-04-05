require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
 describe 'As a user' do
    before(:each) do
      @member_1 = ServiceFacade.new.affiliation_members("Fire Nation").first
      @member_2 = ServiceFacade.new.affiliation_members("Fire Nation").find {|member| member.id == "5cf5679a915ecad153ab691c"}
    end

    it 'Allows to navigate from welcome page to a search page where all members for the selected affiliation are listed and detailed' do
      # As a user, When I visit "/"
      visit "/"
        # And I Select "Fire Nation" from the select field
        select("Fire Nation")
        # And I click "Search For Members"
        click_button("Search For Members")
      # Then I should be on page "/search"
      expect(current_path).to eq("/search")
    end
  end
end