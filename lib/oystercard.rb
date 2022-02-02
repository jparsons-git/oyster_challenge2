class Oystercard

  MAXIMUM_BALANCE = 90  
  MINIMUM_BALANCE = 1  
  attr_reader :balance 
  attr_accessor :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end 
  
  def in_journey?
    return @entry_station = nil ? false : true
  end  

  def top_up(amount)
    raise "Top up failed: maximum balnce is £#{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Touch in failed: minimum balance required to touch in is £#{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    @entry_station = station 
  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
