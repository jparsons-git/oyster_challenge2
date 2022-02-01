require_relative '../lib/oystercard'

describe Oystercard do
  subject(:card) { described_class.new } # allows the use of 'card' instead of 'subject' for clarity

  describe '#balance' do
    it "a new instance of oystercard has a balance of zero" do
      # oystercard = Oystercard.new 
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
      card.deduct(25)
      expect(card.balance).to eq 25 
    end    
  end

  describe '#touch_in' do
    it "change the 'status' of the card to be in_journey?" do
      card.top_up(50)
      card.touch_in
      expect(card.in_journey).to eq true 
    end    
    it "check the card has a minimun balance of £1 to allow touch_in" do
      expect { card.touch_in }.to raise_error "Touch in failed: minimum balance required to touch in is £1"
    end    
  end

  describe '#touch_out' do
    it "change the 'status' of the card to be in_journey?" do
      card.top_up(50)
      card.touch_out
      expect(card.in_journey).to eq false 
    end    
  end
  
end
