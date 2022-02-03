# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in
describe "User Story 10" do
  
  #let(:station) { Station.new("Holborn", 1) }

  xit "it's a Station object" do
    # REDUNDANT Test - Keeping it for future reference"
    station = Station.new("Holborn", 1)
    expect(station).to be_instance_of(Station)
  end

  it "a station has a name and zone" do
    station = Station.new("Holborn", 1)
    expect(station.name).to eq "Holborn"
    expect(station.zone).to eq 1
  end

end