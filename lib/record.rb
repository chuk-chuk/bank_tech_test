class Record
  attr_reader :time, :type, :amount, :balance

  def initialize(time, type, amount, balance)
    @time = time
    @type = type
    @amount = amount
    @balance = balance
  end
end
