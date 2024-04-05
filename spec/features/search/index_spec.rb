require 'rails_helper'

RSpec.describe 'Search index Page', type: :feature do
 describe 'As a user' do
  before(:each) do
    @member_1 = ServiceFacade.new.affiliation_members("Fire Nation").first
    @member_2 = ServiceFacade.new.affiliation_members("Fire Nation").find {|member| member.id == "5cf5679a915ecad153ab691c"}
  end

  it 'Shows all members for the selected affiliation are listed and detailed' do
    visit "/"
      select("Fire Nation")
      click_button("Search For Members")
    expect(current_path).to eq("/search")
    
    # Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
    expect(page).to have_content("Number of people: 97")
    # And I should see a list with the detailed information for the first 25 members of the Fire Nation.
    expect(page).to have_content("First 25 Members")
    # And for each of the members I should see:
      within "#member-#{@member_1.id}" do
        # - The name of the member (and their photo, if they have one)
        expect(page).to have_content("Azula")
        # - The list of allies or "None"
        within ".Allies" do
          expect(page).to have_content("Ozai")
          expect(page).to have_content("Zuko")
        end
        # - The list of enemies or "None"
        within ".Enemies" do
          expect(page).to have_content("Iroh")
          expect(page).to have_content("Ursa")
        end
        # - Any affiliations that the member has
        within ".Affiliations" do
          expect(page).to have_content("Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)")
        end
      end

      within "#member-#{@member_2.id}" do
        expect(page).to have_content("Elua")
        # - The list of allies or "None"
        within ".Allies" do
          expect(page).to have_content("Ozai")
        end
        # - The list of enemies or "None"
        within ".Enemies" do
          expect(page).to have_content("None")
        end
        within ".Affiliations" do
          expect(page).to have_content("Fire Nation Fire Nation Royal Family")
        end
      end
    end
  end
end