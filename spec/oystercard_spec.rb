require_relative '../lib/oystercard'
require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new } # allows the use of 'card' instead of 'subject' for clarity
  let(:station){ double :station }

  describe '#initialize' do
    it "check journey list is empty when vreating a new oystercard" do
      expect(card.journeys.length).to be == 0
    end
  end

  describe '#balance' do
    it "a new instance of oystercard has a balance of zero" do
      # oystercard = Oystercard.new - don't need this because line sets up 'card' to be a Oystercard.new
      expect(card.balance).to eq 0  
    end
  end   
  
  describe '#top_up' do
    it "increases the balance on the card by the value given" do 
      card.top_up(10)
      expect(card.balance).to eq 10
    end

    it "raise an error if the top up would increase the balance beyond the maximum limit" do
      expect { card.top_up(100) }.to raise_error "Top up failed: maximum balnce is £90"
    end
  end

  describe '#deduct' do
    it "reduces the balance on the card by the values given" do
      card.top_up(50)
      card.send(:deduct,25)
      #result = @obj.send(:my_private_method, arguments) - syntax I found
      expect(card.balance).to eq 25 
    end    
  end

  describe '#touch_in' do
    it "check the card has a minimun balance of £1 to allow touch_in" do
      expect { card.touch_in(station) }.to raise_error "Touch in failed: minimum balance required to touch in is £1"
    end 
    it 'stores the entry station' do
      card.top_up(50)
      card.touch_in(station)
      expect(card.entry_station).to eq station
    end

  end

  describe '#touch_out' do
    it "change the 'status' of the card to be in_journey?" do
      card.top_up(50)
      card.touch_out(station)
      expect(card.entry_station).to eq nil 
    end 
    it "check the balance is reduced by the minimum fare on touch out" do
      card.top_up(50)
      expect {card.touch_out(station)}.to change{card.balance}.by(-1)
    end 
    it "replaces the entry station with nil after touch out" do
      card.top_up(50)
      card.touch_in(station)
      card.touch_out(station)
      expect(card.entry_station).to eq nil
    end  
    it "stores the exit station" do
      card.top_up(50)
      card.touch_in(station)
      card.touch_out(station)
      expect(card.entry_station).to eq nil
    end 
    # start on the journeys{} list here  
    it "adds the completed journey to the journeys list which is a hash" do
      card.top_up(50)
      card.touch_in(station)
      card.touch_out(station)
      expect(card.journeys.length).to be > 0
    end 
  end

  describe '#in_journey' do
    it "checks if in_journey is false when setting up a new card" do
      expect(!card.in_journey?)
    end  
    it "checks if in_journey is true after touching in" do
      card.top_up(50)
      card.touch_in(station)
      expect(card.in_journey?)
    end  
    it "checks if in_journey is false after touching in and touching out" do
      card.top_up(50)
      card.touch_in(station)
      card.touch_out(station)
      expect(card.in_journey?)
    end   
  end
  
end
