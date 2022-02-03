require_relative '../lib/journey'

describe Journey do
  it 'has an entry_station' do
    entry_station = Station.new("Bob", 1)
    subject.entry_station = entry_station
    expect(subject.entry_station.name).to eq "Bob"
  end  
  it 'has an exit_station' do
    exit_station = Station.new("Fred", 1)
    subject.exit_station = exit_station
    expect(subject.exit_station.name).to eq "Fred"
  end  
end   
