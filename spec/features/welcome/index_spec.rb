require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
 describe 'As a user' do
  before(:each) do
    @member_1 = MemberServiceFacade.new.affiliation_members("Fire Nation").first
    @member_2 = MemberServiceFacade.new.affiliation_members("Fire Nation").find_by(id: "5cf5679a915ecad153ab691c")
  end
  it 'Allows to navigate from welcome page to a search page where all members for the selected affiliation are listed and detailed' do
    # As a user, When I visit "/"
    visit "/"
    within "#nav navbar-nav" do
      # And I Select "Fire Nation" from the select field
      select("Fire Nation")
      # And I click "Search For Members"
      click_button("Search For Members")
    end
    # Then I should be on page "/search"
    expect(current_path).to eq("/search")
    # Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
    expect(page).to have_content("Number of people: 100")
    # And I should see a list with the detailed information for the first 25 members of the Fire Nation.
    expect(page).to have_content("First 25 members:")
    # And for each of the members I should see:
      within "#member-#{@member_1.id}" do
        # - The name of the member (and their photo, if they have one)
        expect(page).to have_content("Azula")
        expect(page).to have_content("Photo")
        # - The list of allies or "None"
        within "Allies" do
          expect(page).to have_content("Ozai")
          expect(page).to have_content("Zuko")
        end
        # - The list of enemies or "None"
        within "Enemies" do
          expect(page).to have_content("Iroh")
          expect(page).to have_content("Ursa")
        end
        # - Any affiliations that the member has
        within "Affiliations" do
          expect(page).to have_content(" Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)")
        end
      end

      within "#member-#{@member_2.id}" do
        expect(page).to have_content("Elua")
        expect(page).to have_content("Photo")
        # - The list of allies or "None"
        within "Allies" do
          expect(page).to have_content("Ozai")
        end
        # - The list of enemies or "None"
        within "Enemies" do
          expect(page).to have_content("None")
        end
        within "Affiliations" do
          expect(page).to have_content(" Fire Nation Fire Nation Royal Family")
        end
      end
    end
  end
end