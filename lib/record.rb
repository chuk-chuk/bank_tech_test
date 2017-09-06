class Record
  attr_reader :time, :type, :amount, :balance

  def initialize(time, amount, type, balance)
    @time = time
    @type = type
    @amount = amount
    @balance = balance
  end
end
