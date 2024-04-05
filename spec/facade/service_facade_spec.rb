require 'rails_helper'

RSpec.describe ServiceFacade do
  before do
    facade = ServiceFacade.new
    @fire_members = facade.affiliation_members("fire+nation")
  end

  it 'affiliation_members returns an array of member objects' do
    expect(@fire_members).to be_an(Array)
    expect(@fire_members.all? { |member| member.is_a?(Member) }).to eq(true)
  end
end