require 'rails_helper'

RSpec.describe Member do
  before do
    data = {
      "_id": "5cf5679a915ecad153ab6ab6",
      "allies": [
          "Iroh"
      ],
      "enemies": [
          "Azula",
          "Ozai",
          ""
      ],
      "photoUrl": "https://vignette.wikia.nocookie.net/avatar/images/4/4b/Zuko.png/revision/latest?cb=20180630112142",
      "name": "Zuko",
      "affiliation": " Fire Nation Fire Nation Royal Family Team Avatar (Mid Summer 100 AG—)"
    }
    @member = Member.new(data)
  end

  it 'exists' do
    expect(@member).to be_a(Member)
  end

  it 'populates attributes correctly' do
    expect(@member.id).to eq("5cf5679a915ecad153ab6ab6")
    expect(@member.name).to eq("Zuko")
    expect(@member.photo_path).to eq("https://vignette.wikia.nocookie.net/avatar/images/4/4b/Zuko.png/revision/latest?cb=20180630112142")
    expect(@member.allies).to eq(["Iroh"])
    expect(@member.enemies).to eq(["Azula", "Ozai"])
    expect(@member.affiliation).to eq(" Fire Nation Fire Nation Royal Family Team Avatar (Mid Summer 100 AG—)")
  end
end