class Oystercard

  MAXIMUM_BALANCE = 90  
  MINIMUM_BALANCE = 1  
  attr_reader :balance 
  attr_accessor :in_journey


  def initialize
    @balance = 0
  end         

  def top_up(amount)
    raise "Top up failed: maximum balnce is £90" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Touch in failed: minimum balance required to touch in is £1" if balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end