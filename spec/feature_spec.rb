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

# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out
describe 'User Story 11 - new Journey Class' do
  it "check it's a journey object" do
    journey = Journey.new
    expect(journey).to be_instance_of(Journey)
  end  

  it "it has an entry and an exit station" do
    entry_station = Station.new("Bob", 1)
    journey = Journey.new
    exit_station = Station.new("Fred", 2)
    journey.entry_station = entry_station
    journey.exit_station = exit_station
    expect(journey.entry_station.name).to eq "Bob"
    expect(journey.exit_station.name).to eq "Fred"
  end
end
