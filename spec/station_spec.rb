require_relative '../lib/station'

describe Station do
  
  # subject(:station) { Station.new("Bob", 1)}

  it "responds to 2 arguments" do
    #expect(described_class).to respond_to(:new).with(2).arguments
    expect(Station).to respond_to(:new).with(2).arguments
  end

  it "shows a name" do
    station = Station.new("Bob", 1)
    expect(station.name).to eq "Bob"
  end
  
  it "shows a zone" do
    station = Station.new("Bob", 1)
    expect(station.zone).to eq 1
  end
end