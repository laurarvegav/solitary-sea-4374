require 'rails_helper'

RSpec.describe SearchService do
  describe 'Instance Methods' do
    it "gets URL, populating API records into JSON", :vcr do
      uri = "characters?affiliation=Fire Nation&perPage=97&page=1"

      parsed_members = SearchService.new.get_url(uri)

      expect(parsed_members).to be_an(Array)
      expect(parsed_members.all? { |data| data.is_a?(Hash) }).to eq(true)
    end
  end
end
